@interface OrgXmlSaxHelpersParserAdapter_AttributeListAdapter
+ (const)__metadata;
- (OrgXmlSaxHelpersParserAdapter_AttributeListAdapter)initWithOrgXmlSaxHelpersParserAdapter:(id)a3;
- (id)getLocalNameWithInt:(int)a3;
- (id)getQNameWithInt:(int)a3;
- (id)getTypeWithInt:(int)a3;
- (id)getTypeWithNSString:(id)a3;
- (id)getTypeWithNSString:(id)a3 withNSString:(id)a4;
- (id)getURIWithInt:(int)a3;
- (id)getValueWithInt:(int)a3;
- (id)getValueWithNSString:(id)a3;
- (id)getValueWithNSString:(id)a3 withNSString:(id)a4;
- (int)getIndexWithNSString:(id)a3;
- (int)getIndexWithNSString:(id)a3 withNSString:(id)a4;
- (int)getLength;
- (void)__javaClone;
- (void)dealloc;
- (void)setAttributeListWithOrgXmlSaxAttributeList:(id)a3;
@end

@implementation OrgXmlSaxHelpersParserAdapter_AttributeListAdapter

- (OrgXmlSaxHelpersParserAdapter_AttributeListAdapter)initWithOrgXmlSaxHelpersParserAdapter:(id)a3
{
  return self;
}

- (void)setAttributeListWithOrgXmlSaxAttributeList:(id)a3
{
}

- (int)getLength
{
  qAtts = self->qAtts_;
  if (!qAtts) {
    JreThrowNullPointerException();
  }
  return [(OrgXmlSaxAttributeList *)qAtts getLength];
}

- (id)getURIWithInt:(int)a3
{
  return &stru_10048C1F8;
}

- (id)getLocalNameWithInt:(int)a3
{
  return &stru_10048C1F8;
}

- (id)getQNameWithInt:(int)a3
{
  qAtts = self->qAtts_;
  if (!qAtts || (id v4 = [(OrgXmlSaxAttributeList *)qAtts getNameWithInt:*(void *)&a3]) == 0) {
    JreThrowNullPointerException();
  }
  return [v4 intern];
}

- (id)getTypeWithInt:(int)a3
{
  qAtts = self->qAtts_;
  if (!qAtts || (id v4 = [(OrgXmlSaxAttributeList *)qAtts getTypeWithInt:*(void *)&a3]) == 0) {
    JreThrowNullPointerException();
  }
  return [v4 intern];
}

- (id)getValueWithInt:(int)a3
{
  qAtts = self->qAtts_;
  if (!qAtts) {
    JreThrowNullPointerException();
  }
  return [(OrgXmlSaxAttributeList *)qAtts getValueWithInt:*(void *)&a3];
}

- (int)getIndexWithNSString:(id)a3 withNSString:(id)a4
{
  return -1;
}

- (int)getIndexWithNSString:(id)a3
{
  v5 = (void *)*(objc_loadWeak((id *)&self->this$0_) + 11);
  if (!v5) {
    goto LABEL_10;
  }
  int v6 = [v5 getLength];
  if (v6 >= 1)
  {
    int v7 = v6;
    uint64_t v8 = 0;
    while (1)
    {
      qAtts = self->qAtts_;
      if (!qAtts) {
        break;
      }
      id v10 = [(OrgXmlSaxAttributeList *)qAtts getNameWithInt:v8];
      if (!v10) {
        break;
      }
      if ([v10 isEqual:a3]) {
        return v8;
      }
      uint64_t v8 = (v8 + 1);
      if (v7 == v8) {
        goto LABEL_8;
      }
    }
LABEL_10:
    JreThrowNullPointerException();
  }
LABEL_8:
  LODWORD(v8) = -1;
  return v8;
}

- (id)getTypeWithNSString:(id)a3 withNSString:(id)a4
{
  return 0;
}

- (id)getTypeWithNSString:(id)a3
{
  qAtts = self->qAtts_;
  if (!qAtts || (id v4 = [(OrgXmlSaxAttributeList *)qAtts getTypeWithNSString:a3]) == 0) {
    JreThrowNullPointerException();
  }
  return [v4 intern];
}

- (id)getValueWithNSString:(id)a3 withNSString:(id)a4
{
  return 0;
}

- (id)getValueWithNSString:(id)a3
{
  qAtts = self->qAtts_;
  if (!qAtts) {
    JreThrowNullPointerException();
  }
  return [(OrgXmlSaxAttributeList *)qAtts getValueWithNSString:a3];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgXmlSaxHelpersParserAdapter_AttributeListAdapter;
  [(OrgXmlSaxHelpersParserAdapter_AttributeListAdapter *)&v3 dealloc];
}

- (void)__javaClone
{
  v3.receiver = self;
  v3.super_class = (Class)OrgXmlSaxHelpersParserAdapter_AttributeListAdapter;
  [(OrgXmlSaxHelpersParserAdapter_AttributeListAdapter *)&v3 __javaClone];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100417888;
}

- (void).cxx_destruct
{
}

@end