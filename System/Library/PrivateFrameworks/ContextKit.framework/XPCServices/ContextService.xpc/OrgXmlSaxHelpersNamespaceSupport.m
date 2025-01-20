@interface OrgXmlSaxHelpersNamespaceSupport
+ (const)__metadata;
+ (void)initialize;
- (BOOL)declarePrefixWithNSString:(id)a3 withNSString:(id)a4;
- (BOOL)isNamespaceDeclUris;
- (OrgXmlSaxHelpersNamespaceSupport)init;
- (id)getDeclaredPrefixes;
- (id)getPrefixWithNSString:(id)a3;
- (id)getPrefixes;
- (id)getPrefixesWithNSString:(id)a3;
- (id)getURIWithNSString:(id)a3;
- (id)processNameWithNSString:(id)a3 withNSStringArray:(id)a4 withBoolean:(BOOL)a5;
- (void)dealloc;
- (void)popContext;
- (void)pushContext;
- (void)reset;
- (void)setNamespaceDeclUrisWithBoolean:(BOOL)a3;
@end

@implementation OrgXmlSaxHelpersNamespaceSupport

- (OrgXmlSaxHelpersNamespaceSupport)init
{
  return self;
}

- (void)reset
{
  if (qword_100562DF0 != -1) {
    dispatch_once(&qword_100562DF0, &stru_10047DD08);
  }
  JreStrongAssignAndConsume((id *)&self->contexts_, +[IOSObjectArray newArrayWithLength:32 type:qword_100562DE8]);
  self->namespaceDeclUris_ = 0;
  self->contextPos_ = 0;
  contexts = self->contexts_;
  v4 = [OrgXmlSaxHelpersNamespaceSupport_Context alloc];
  OrgXmlSaxHelpersNamespaceSupport_Context_initWithOrgXmlSaxHelpersNamespaceSupport_((uint64_t)v4, self);
  v5 = JreStrongAssignAndConsume((id *)&self->currentContext_, v4);
  IOSObjectArray_Set((uint64_t)contexts, 0, v5);
  currentContext = self->currentContext_;
  uint64_t v7 = OrgXmlSaxHelpersNamespaceSupport_XMLNS_;
  [(OrgXmlSaxHelpersNamespaceSupport_Context *)currentContext declarePrefixWithNSString:@"xml" withNSString:v7];
}

- (void)pushContext
{
  p_contexts = &self->contexts_;
  contexts = self->contexts_;
  if (!contexts) {
    goto LABEL_20;
  }
  uint64_t size = contexts->super.size_;
  int contextPos = self->contextPos_;
  if (contextPos < 0 || contextPos >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(contexts->super.size_, contextPos);
  }
  uint64_t v7 = (&contexts->elementType_)[contextPos];
  if (!v7) {
    goto LABEL_20;
  }
  LOBYTE(v7[6].super.isa) = 0;
  int v8 = self->contextPos_ + 1;
  self->contextPos_ = v8;
  if (v8 >= (int)size)
  {
    if (qword_100562DF0 != -1) {
      dispatch_once(&qword_100562DF0, &stru_10047DD08);
    }
    v9 = +[IOSObjectArray arrayWithLength:2 * (int)size type:qword_100562DE8];
    JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(self->contexts_, 0, v9, 0, size);
    JreStrongAssign((id *)p_contexts, v9);
    int v8 = self->contextPos_;
  }
  p_currentContext = &self->currentContext_;
  v11 = self->contexts_;
  uint64_t v12 = v11->super.size_;
  if (v8 < 0 || v8 >= (int)v12) {
    IOSArray_throwOutOfBoundsWithMsg(v12, v8);
  }
  JreStrongAssign((id *)&self->currentContext_, (&v11->elementType_)[v8]);
  if (!*p_currentContext)
  {
    v13 = self->contexts_;
    uint64_t v14 = self->contextPos_;
    v15 = [OrgXmlSaxHelpersNamespaceSupport_Context alloc];
    OrgXmlSaxHelpersNamespaceSupport_Context_initWithOrgXmlSaxHelpersNamespaceSupport_((uint64_t)v15, self);
    v16 = JreStrongAssignAndConsume((id *)&self->currentContext_, v15);
    IOSObjectArray_Set((uint64_t)v13, v14, v16);
  }
  int v17 = self->contextPos_;
  if (v17 >= 1)
  {
    v18 = *p_currentContext;
    if (v18)
    {
      v19 = *p_contexts;
      uint64_t v20 = v19->super.size_;
      if (v17 > (int)v20) {
        IOSArray_throwOutOfBoundsWithMsg(v20, (v17 - 1));
      }
      v21 = (&v19->elementType_)[v17 - 1];
      [(OrgXmlSaxHelpersNamespaceSupport_Context *)v18 setParentWithOrgXmlSaxHelpersNamespaceSupport_Context:v21];
      return;
    }
LABEL_20:
    JreThrowNullPointerException();
  }
}

- (void)popContext
{
  contexts = self->contexts_;
  if (!contexts) {
    goto LABEL_10;
  }
  int contextPos = self->contextPos_;
  uint64_t size = contexts->super.size_;
  if (contextPos < 0 || contextPos >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, contextPos);
  }
  v6 = (&contexts->elementType_)[contextPos];
  if (!v6) {
LABEL_10:
  }
    JreThrowNullPointerException();
  [(IOSClass *)v6 clear];
  int v7 = self->contextPos_;
  uint64_t v8 = (v7 - 1);
  self->contextPos_ = v8;
  if (v7 - 1 < 0)
  {
    uint64_t v12 = new_JavaUtilEmptyStackException_init();
    objc_exception_throw(v12);
  }
  v9 = self->contexts_;
  uint64_t v10 = v9->super.size_;
  if ((int)v8 >= (int)v10) {
    IOSArray_throwOutOfBoundsWithMsg(v10, v8);
  }
  v11 = (&v9->elementType_)[v8];
  JreStrongAssign((id *)&self->currentContext_, v11);
}

- (BOOL)declarePrefixWithNSString:(id)a3 withNSString:(id)a4
{
  if (!a3) {
    goto LABEL_7;
  }
  if (([a3 isEqual:@"xml"] & 1) != 0
    || ([a3 isEqual:@"xmlns"] & 1) != 0)
  {
    return 0;
  }
  currentContext = self->currentContext_;
  if (!currentContext) {
LABEL_7:
  }
    JreThrowNullPointerException();
  [(OrgXmlSaxHelpersNamespaceSupport_Context *)currentContext declarePrefixWithNSString:a3 withNSString:a4];
  return 1;
}

- (id)processNameWithNSString:(id)a3 withNSStringArray:(id)a4 withBoolean:(BOOL)a5
{
  currentContext = self->currentContext_;
  if (!currentContext) {
    goto LABEL_10;
  }
  int v7 = [(OrgXmlSaxHelpersNamespaceSupport_Context *)currentContext processNameWithNSString:a3 withBoolean:a5];
  if (!v7) {
    return 0;
  }
  if (!a4) {
LABEL_10:
  }
    JreThrowNullPointerException();
  uint64_t v8 = (void **)v7;
  uint64_t v9 = v7[2];
  if ((int)v9 < 1) {
    IOSArray_throwOutOfBoundsWithMsg(v9, 0);
  }
  IOSObjectArray_Set((uint64_t)a4, 0, v8[3]);
  uint64_t v10 = *((unsigned int *)v8 + 2);
  if ((int)v10 < 2) {
    IOSArray_throwOutOfBoundsWithMsg(v10, 1);
  }
  IOSObjectArray_Set((uint64_t)a4, 1, v8[4]);
  uint64_t v11 = *((unsigned int *)v8 + 2);
  if ((int)v11 <= 2) {
    IOSArray_throwOutOfBoundsWithMsg(v11, 2);
  }
  IOSObjectArray_Set((uint64_t)a4, 2, v8[5]);
  return a4;
}

- (id)getURIWithNSString:(id)a3
{
  currentContext = self->currentContext_;
  if (!currentContext) {
    JreThrowNullPointerException();
  }
  return [(OrgXmlSaxHelpersNamespaceSupport_Context *)currentContext getURIWithNSString:a3];
}

- (id)getPrefixes
{
  currentContext = self->currentContext_;
  if (!currentContext) {
    JreThrowNullPointerException();
  }
  return [(OrgXmlSaxHelpersNamespaceSupport_Context *)currentContext getPrefixes];
}

- (id)getPrefixWithNSString:(id)a3
{
  currentContext = self->currentContext_;
  if (!currentContext) {
    JreThrowNullPointerException();
  }
  return [(OrgXmlSaxHelpersNamespaceSupport_Context *)currentContext getPrefixWithNSString:a3];
}

- (id)getPrefixesWithNSString:(id)a3
{
  v5 = new_JavaUtilArrayList_init();
  id v6 = [(OrgXmlSaxHelpersNamespaceSupport *)self getPrefixes];
  if (!v6) {
    goto LABEL_12;
  }
  int v7 = v6;
  if ([v6 hasMoreElements])
  {
    while (1)
    {
      id v8 = [v7 nextElement];
      objc_opt_class();
      if (v8 && (objc_opt_isKindOfClass() & 1) == 0) {
        JreThrowClassCastException();
      }
      if (!a3) {
        break;
      }
      if (objc_msgSend(a3, "isEqual:", -[OrgXmlSaxHelpersNamespaceSupport getURIWithNSString:](self, "getURIWithNSString:", v8)))-[JavaUtilArrayList addWithId:](v5, "addWithId:", v8); {
      if (([v7 hasMoreElements] & 1) == 0)
      }
        goto LABEL_9;
    }
LABEL_12:
    JreThrowNullPointerException();
  }
LABEL_9:
  return JavaUtilCollections_enumerationWithJavaUtilCollection_(v5);
}

- (id)getDeclaredPrefixes
{
  currentContext = self->currentContext_;
  if (!currentContext) {
    JreThrowNullPointerException();
  }
  return [(OrgXmlSaxHelpersNamespaceSupport_Context *)currentContext getDeclaredPrefixes];
}

- (void)setNamespaceDeclUrisWithBoolean:(BOOL)a3
{
  if (self->contextPos_)
  {
    uint64_t v10 = new_JavaLangIllegalStateException_init();
    objc_exception_throw(v10);
  }
  if (self->namespaceDeclUris_ != a3)
  {
    self->namespaceDeclUris_ = a3;
    if (a3)
    {
      currentContext = self->currentContext_;
      if (currentContext)
      {
        uint64_t v5 = OrgXmlSaxHelpersNamespaceSupport_NSDECL_;
        CFStringRef v6 = @"xmlns";
LABEL_8:
        [(OrgXmlSaxHelpersNamespaceSupport_Context *)currentContext declarePrefixWithNSString:v6 withNSString:v5];
        return;
      }
    }
    else
    {
      contexts = self->contexts_;
      if (contexts)
      {
        id v8 = [OrgXmlSaxHelpersNamespaceSupport_Context alloc];
        OrgXmlSaxHelpersNamespaceSupport_Context_initWithOrgXmlSaxHelpersNamespaceSupport_((uint64_t)v8, self);
        uint64_t v9 = JreStrongAssignAndConsume((id *)&self->currentContext_, v8);
        IOSObjectArray_Set((uint64_t)contexts, 0, v9);
        currentContext = self->currentContext_;
        uint64_t v5 = OrgXmlSaxHelpersNamespaceSupport_XMLNS_;
        CFStringRef v6 = @"xml";
        goto LABEL_8;
      }
    }
    JreThrowNullPointerException();
  }
}

- (BOOL)isNamespaceDeclUris
{
  return self->namespaceDeclUris_;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgXmlSaxHelpersNamespaceSupport;
  [(OrgXmlSaxHelpersNamespaceSupport *)&v3 dealloc];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = (void *)JavaUtilCollections_emptyList();
    objc_super v3 = JavaUtilCollections_enumerationWithJavaUtilCollection_(v2);
    JreStrongAssign((id *)&qword_100562DE0, v3);
    atomic_store(1u, OrgXmlSaxHelpersNamespaceSupport__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10047D818;
}

@end