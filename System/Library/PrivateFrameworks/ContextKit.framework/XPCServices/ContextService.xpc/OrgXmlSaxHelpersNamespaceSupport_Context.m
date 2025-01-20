@interface OrgXmlSaxHelpersNamespaceSupport_Context
+ (const)__metadata;
- (OrgXmlSaxHelpersNamespaceSupport_Context)initWithOrgXmlSaxHelpersNamespaceSupport:(id)a3;
- (id)getDeclaredPrefixes;
- (id)getPrefixWithNSString:(id)a3;
- (id)getPrefixes;
- (id)getURIWithNSString:(id)a3;
- (id)processNameWithNSString:(id)a3 withBoolean:(BOOL)a4;
- (void)__javaClone;
- (void)clear;
- (void)copyTables;
- (void)dealloc;
- (void)declarePrefixWithNSString:(id)a3 withNSString:(id)a4;
- (void)setParentWithOrgXmlSaxHelpersNamespaceSupport_Context:(id)a3;
@end

@implementation OrgXmlSaxHelpersNamespaceSupport_Context

- (OrgXmlSaxHelpersNamespaceSupport_Context)initWithOrgXmlSaxHelpersNamespaceSupport:(id)a3
{
  return self;
}

- (void)setParentWithOrgXmlSaxHelpersNamespaceSupport_Context:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  JreStrongAssign((id *)&self->prefixTable_, *((void **)a3 + 1));
  JreStrongAssign((id *)&self->uriTable_, *((void **)a3 + 2));
  JreStrongAssign((id *)&self->elementNameTable_, *((void **)a3 + 3));
  JreStrongAssign((id *)&self->attributeNameTable_, *((void **)a3 + 4));
  JreStrongAssign((id *)&self->defaultNS_, *((void **)a3 + 5));
  self->declSeen_ = 0;
  self->declsOK_ = 1;
}

- (void)clear
{
  JreStrongAssign((id *)&self->parent_, 0);
  JreStrongAssign((id *)&self->prefixTable_, 0);
  JreStrongAssign((id *)&self->uriTable_, 0);
  JreStrongAssign((id *)&self->elementNameTable_, 0);
  JreStrongAssign((id *)&self->attributeNameTable_, 0);
  JreStrongAssign((id *)&self->defaultNS_, 0);
}

- (void)declarePrefixWithNSString:(id)a3 withNSString:(id)a4
{
  if (!self->declsOK_)
  {
    v16 = new_JavaLangIllegalStateException_initWithNSString_(@"can't declare any more prefixes in this context");
    objc_exception_throw(v16);
  }
  if (!self->declSeen_) {
    -[OrgXmlSaxHelpersNamespaceSupport_Context copyTables]_0((uint64_t)self);
  }
  p_declarations = &self->declarations_;
  if (!self->declarations_)
  {
    v8 = new_JavaUtilArrayList_init();
    JreStrongAssignAndConsume((id *)&self->declarations_, v8);
  }
  if (!a3) {
    goto LABEL_20;
  }
  id v9 = [a3 intern];
  if (!a4) {
    goto LABEL_20;
  }
  id v10 = v9;
  id v11 = [a4 intern];
  if (![&stru_10048C1F8 isEqual:v10])
  {
    prefixTable = self->prefixTable_;
    if (prefixTable)
    {
      [(JavaUtilHashtable *)prefixTable putWithId:v10 withId:v11];
      uriTable = self->uriTable_;
      if (uriTable)
      {
        [(JavaUtilHashtable *)uriTable putWithId:v11 withId:v10];
        goto LABEL_16;
      }
    }
LABEL_20:
    JreThrowNullPointerException();
  }
  if ([&stru_10048C1F8 isEqual:v11]) {
    v12 = 0;
  }
  else {
    v12 = v11;
  }
  JreStrongAssign((id *)&self->defaultNS_, v12);
LABEL_16:
  v15 = *p_declarations;
  if (!*p_declarations) {
    goto LABEL_20;
  }
  [(JavaUtilArrayList *)v15 addWithId:v10];
}

- (void)copyTables
{
  v3 = (id *)(a1 + 8);
  v2 = *(void **)(a1 + 8);
  if (v2)
  {
    id v4 = [v2 clone];
    objc_opt_class();
    if (v4 && (objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_12;
    }
    JreStrongAssign(v3, v4);
  }
  else
  {
    v5 = new_JavaUtilHashtable_init();
    JreStrongAssignAndConsume(v3, v5);
  }
  v6 = *(void **)(a1 + 16);
  if (!v6)
  {
    v8 = new_JavaUtilHashtable_init();
    JreStrongAssignAndConsume((id *)(a1 + 16), v8);
    goto LABEL_11;
  }
  id v7 = [v6 clone];
  objc_opt_class();
  if (v7 && (objc_opt_isKindOfClass() & 1) == 0) {
LABEL_12:
  }
    JreThrowClassCastException();
  JreStrongAssign((id *)(a1 + 16), v7);
LABEL_11:
  id v9 = new_JavaUtilHashtable_init();
  JreStrongAssignAndConsume((id *)(a1 + 24), v9);
  id v10 = new_JavaUtilHashtable_init();
  result = JreStrongAssignAndConsume((id *)(a1 + 32), v10);
  *(unsigned char *)(a1 + 72) = 1;
  return result;
}

- (id)processNameWithNSString:(id)a3 withBoolean:(BOOL)a4
{
  self->declsOK_ = 0;
  uint64_t v4 = 24;
  if (a4) {
    uint64_t v4 = 32;
  }
  v5 = *(Class *)((char *)&self->super.isa + v4);
  if (!v5) {
    goto LABEL_31;
  }
  BOOL v6 = a4;
  id v9 = (IOSObjectArray *)objc_msgSend(*(id *)((char *)&self->super.isa + v4), "getWithId:");
  objc_opt_class();
  if (!v9)
  {
    id v10 = +[IOSObjectArray arrayWithLength:3 type:NSString_class_()];
    if (!a3) {
      goto LABEL_31;
    }
    id v9 = v10;
    IOSObjectArray_Set((uint64_t)v10, 2, [a3 intern]);
    id v11 = [a3 indexOf:58];
    if (v11 != -1)
    {
      int v12 = (int)v11;
      id v13 = [a3 substring:0 endIndex:v11];
      id v14 = [a3 substring:(v12 + 1)];
      if ([&stru_10048C1F8 isEqual:v13])
      {
        defaultNS = self->defaultNS_;
        if (!defaultNS) {
          return 0;
        }
      }
      else
      {
        prefixTable = self->prefixTable_;
        if (!prefixTable) {
          goto LABEL_31;
        }
        defaultNS = [(JavaUtilHashtable *)prefixTable getWithId:v13];
        objc_opt_class();
        if (!defaultNS) {
          return 0;
        }
        if ((objc_opt_isKindOfClass() & 1) == 0) {
LABEL_6:
        }
          JreThrowClassCastException();
      }
      if (!v6 && ([@"xmlns" isEqual:v13] & 1) != 0) {
        return 0;
      }
      IOSObjectArray_Set((uint64_t)v9, 0, defaultNS);
      if (v14)
      {
        id v18 = [v14 intern];
LABEL_28:
        IOSObjectArray_Set((uint64_t)v9, 1, v18);
        uint64_t size = v9->super.size_;
        if ((int)size <= 2) {
          IOSArray_throwOutOfBoundsWithMsg(size, 2);
        }
        [v5 putWithId:v9->buffer_[1] withId:v9];
        return v9;
      }
LABEL_31:
      JreThrowNullPointerException();
    }
    if (v6)
    {
      if ([@"xmlns" isEqual:a3]
        && *((unsigned char *)objc_loadWeak((id *)&self->this$0_) + 28))
      {
        v16 = (__CFString *)OrgXmlSaxHelpersNamespaceSupport_NSDECL_;
LABEL_26:
        IOSObjectArray_Set((uint64_t)v9, 0, v16);
        uint64_t v19 = v9->super.size_;
        if ((int)v19 <= 2) {
          IOSArray_throwOutOfBoundsWithMsg(v19, 2);
        }
        id v18 = v9->buffer_[1];
        goto LABEL_28;
      }
    }
    else
    {
      v16 = (__CFString *)self->defaultNS_;
      if (v16) {
        goto LABEL_26;
      }
    }
    v16 = &stru_10048C1F8;
    goto LABEL_26;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_6;
  }
  return v9;
}

- (id)getURIWithNSString:(id)a3
{
  if (objc_msgSend(&stru_10048C1F8, "isEqual:")) {
    return self->defaultNS_;
  }
  prefixTable = self->prefixTable_;
  if (!prefixTable) {
    return 0;
  }
  id v5 = [(JavaUtilHashtable *)prefixTable getWithId:a3];
  objc_opt_class();
  if (v5 && (objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  return v5;
}

- (id)getPrefixWithNSString:(id)a3
{
  uriTable = self->uriTable_;
  if (!uriTable) {
    return 0;
  }
  id v4 = [(JavaUtilHashtable *)uriTable getWithId:a3];
  objc_opt_class();
  if (v4 && (objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  return v4;
}

- (id)getDeclaredPrefixes
{
  declarations = self->declarations_;
  if (declarations)
  {
    return JavaUtilCollections_enumerationWithJavaUtilCollection_(declarations);
  }
  else
  {
    if ((atomic_load_explicit((atomic_uchar *volatile)OrgXmlSaxHelpersNamespaceSupport__initialized, memory_order_acquire) & 1) == 0)objc_opt_class(); {
    return (id)qword_100562DE0;
    }
  }
}

- (id)getPrefixes
{
  prefixTable = self->prefixTable_;
  if (prefixTable)
  {
    return [(JavaUtilHashtable *)prefixTable keys];
  }
  else
  {
    if ((atomic_load_explicit((atomic_uchar *volatile)OrgXmlSaxHelpersNamespaceSupport__initialized, memory_order_acquire) & 1) == 0)objc_opt_class(); {
    return (id)qword_100562DE0;
    }
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgXmlSaxHelpersNamespaceSupport_Context;
  [(OrgXmlSaxHelpersNamespaceSupport_Context *)&v3 dealloc];
}

- (void)__javaClone
{
  v3.receiver = self;
  v3.super_class = (Class)OrgXmlSaxHelpersNamespaceSupport_Context;
  [(OrgXmlSaxHelpersNamespaceSupport_Context *)&v3 __javaClone];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10047DC98;
}

- (void).cxx_destruct
{
}

@end