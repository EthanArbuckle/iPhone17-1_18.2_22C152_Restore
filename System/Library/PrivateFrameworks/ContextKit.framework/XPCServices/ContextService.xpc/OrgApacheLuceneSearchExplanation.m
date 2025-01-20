@interface OrgApacheLuceneSearchExplanation
+ (id)matchWithFloat:(float)a3 withNSString:(id)a4 withJavaUtilCollection:(id)a5;
+ (id)matchWithFloat:(float)a3 withNSString:(id)a4 withOrgApacheLuceneSearchExplanationArray:(id)a5;
+ (id)noMatchWithNSString:(id)a3 withJavaUtilCollection:(id)a4;
+ (id)noMatchWithNSString:(id)a3 withOrgApacheLuceneSearchExplanationArray:(id)a4;
- (BOOL)isMatch;
- (OrgApacheLuceneSearchExplanation)initWithBoolean:(BOOL)a3 withFloat:(float)a4 withNSString:(id)a5 withJavaUtilCollection:(id)a6;
- (float)getValue;
- (id)description;
- (id)getDescription;
- (id)getDetails;
- (id)getSummary;
- (id)toHtml;
- (id)toStringWithInt:(int)a3;
- (void)dealloc;
@end

@implementation OrgApacheLuceneSearchExplanation

+ (id)matchWithFloat:(float)a3 withNSString:(id)a4 withJavaUtilCollection:(id)a5
{
  return OrgApacheLuceneSearchExplanation_matchWithFloat_withNSString_withJavaUtilCollection_((uint64_t)a4, a5, a3);
}

+ (id)matchWithFloat:(float)a3 withNSString:(id)a4 withOrgApacheLuceneSearchExplanationArray:(id)a5
{
  return OrgApacheLuceneSearchExplanation_matchWithFloat_withNSString_withOrgApacheLuceneSearchExplanationArray_((uint64_t)a4, a5, a3);
}

+ (id)noMatchWithNSString:(id)a3 withJavaUtilCollection:(id)a4
{
  return OrgApacheLuceneSearchExplanation_noMatchWithNSString_withJavaUtilCollection_((uint64_t)a3, a4);
}

+ (id)noMatchWithNSString:(id)a3 withOrgApacheLuceneSearchExplanationArray:(id)a4
{
  return OrgApacheLuceneSearchExplanation_noMatchWithNSString_withOrgApacheLuceneSearchExplanationArray_((uint64_t)a3, a4);
}

- (OrgApacheLuceneSearchExplanation)initWithBoolean:(BOOL)a3 withFloat:(float)a4 withNSString:(id)a5 withJavaUtilCollection:(id)a6
{
  return self;
}

- (BOOL)isMatch
{
  return self->match_;
}

- (float)getValue
{
  return self->value_;
}

- (id)getDescription
{
  return self->description__;
}

- (id)getSummary
{
  [(OrgApacheLuceneSearchExplanation *)self getValue];
  double v4 = v3;
  [(OrgApacheLuceneSearchExplanation *)self getDescription];
  return (id)JreStrcat("F$$", v5, v6, v7, v8, v9, v10, v11, *(id *)&v4);
}

- (id)getDetails
{
  details = self->details_;
  if (!details) {
    JreThrowNullPointerException();
  }
  if (qword_10055FE90 != -1) {
    dispatch_once(&qword_10055FE90, &stru_1003F1890);
  }
  float v3 = +[IOSObjectArray arrayWithLength:0 type:qword_10055FE88];
  return [(JavaUtilList *)details toArrayWithNSObjectArray:v3];
}

- (id)description
{
  return sub_100050C34(self, 0);
}

- (id)toStringWithInt:(int)a3
{
  return sub_100050C34(self, a3);
}

- (id)toHtml
{
  float v3 = new_JavaLangStringBuilder_init();
  [(JavaLangStringBuilder *)v3 appendWithNSString:@"<ul>\n"];
  [(JavaLangStringBuilder *)v3 appendWithNSString:@"<li>"];
  [(OrgApacheLuceneSearchExplanation *)self getValue];
  double v5 = v4;
  [(OrgApacheLuceneSearchExplanation *)self getDescription];
  [(JavaLangStringBuilder *)v3 appendWithNSString:JreStrcat("F$$", v6, v7, v8, v9, v10, v11, v12, *(id *)&v5)];
  [(JavaLangStringBuilder *)v3 appendWithNSString:@"<br />\n"];
  v13 = [(OrgApacheLuceneSearchExplanation *)self getDetails];
  if (!v13) {
    goto LABEL_9;
  }
  v14 = v13;
  if (v13[2] >= 1)
  {
    uint64_t v15 = 0;
    while (1)
    {
      v16 = *(void **)&v14[2 * v15 + 6];
      if (!v16) {
        break;
      }
      -[JavaLangStringBuilder appendWithNSString:](v3, "appendWithNSString:", [v16 toHtml]);
      if (++v15 >= v14[2]) {
        goto LABEL_6;
      }
    }
LABEL_9:
    JreThrowNullPointerException();
  }
LABEL_6:
  [(JavaLangStringBuilder *)v3 appendWithNSString:@"</li>\n"];
  [(JavaLangStringBuilder *)v3 appendWithNSString:@"</ul>\n"];
  return [(JavaLangStringBuilder *)v3 description];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchExplanation;
  [(OrgApacheLuceneSearchExplanation *)&v3 dealloc];
}

@end