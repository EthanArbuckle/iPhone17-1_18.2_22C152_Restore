@interface OrgApacheLuceneIndexSegmentInfo
- (BOOL)getUseCompoundFile;
- (BOOL)isEqual:(id)a3;
- (OrgApacheLuceneIndexSegmentInfo)initWithOrgApacheLuceneStoreDirectory:(id)a3 withOrgApacheLuceneUtilVersion:(id)a4 withNSString:(id)a5 withInt:(int)a6 withBoolean:(BOOL)a7 withOrgApacheLuceneCodecsCodec:(id)a8 withJavaUtilMap:(id)a9 withByteArray:(id)a10 withJavaUtilMap:(id)a11;
- (id)description;
- (id)files;
- (id)getAttributeWithNSString:(id)a3;
- (id)getAttributes;
- (id)getCodec;
- (id)getDiagnostics;
- (id)getId;
- (id)getVersion;
- (id)namedForThisSegmentWithNSString:(id)a3;
- (id)putAttributeWithNSString:(id)a3 withNSString:(id)a4;
- (id)toStringWithInt:(int)a3;
- (id)toStringWithOrgApacheLuceneStoreDirectory:(id)a3 withInt:(int)a4;
- (int)maxDoc;
- (unint64_t)hash;
- (void)addFileWithNSString:(id)a3;
- (void)addFilesWithJavaUtilCollection:(id)a3;
- (void)checkFileNamesWithJavaUtilCollection:(id)a3;
- (void)dealloc;
- (void)setCodecWithOrgApacheLuceneCodecsCodec:(id)a3;
- (void)setDiagnosticsWithJavaUtilMap:(id)a3;
- (void)setFilesWithJavaUtilCollection:(id)a3;
- (void)setMaxDocWithInt:(int)a3;
- (void)setUseCompoundFileWithBoolean:(BOOL)a3;
@end

@implementation OrgApacheLuceneIndexSegmentInfo

- (void)setDiagnosticsWithJavaUtilMap:(id)a3
{
  p_diagnostics = &self->diagnostics_;
  v4 = (void *)OrgLukhnosPortmobileUtilObjects_requireNonNullWithId_((uint64_t)a3);
  JreStrongAssign((id *)p_diagnostics, v4);
}

- (id)getDiagnostics
{
  return self->diagnostics_;
}

- (OrgApacheLuceneIndexSegmentInfo)initWithOrgApacheLuceneStoreDirectory:(id)a3 withOrgApacheLuceneUtilVersion:(id)a4 withNSString:(id)a5 withInt:(int)a6 withBoolean:(BOOL)a7 withOrgApacheLuceneCodecsCodec:(id)a8 withJavaUtilMap:(id)a9 withByteArray:(id)a10 withJavaUtilMap:(id)a11
{
  return self;
}

- (void)setUseCompoundFileWithBoolean:(BOOL)a3
{
  self->isCompoundFile_ = a3;
}

- (BOOL)getUseCompoundFile
{
  return self->isCompoundFile_;
}

- (void)setCodecWithOrgApacheLuceneCodecsCodec:(id)a3
{
  if (!a3)
  {
    v5 = new_JavaLangIllegalArgumentException_initWithNSString_(@"codec must be non-null");
    objc_exception_throw(v5);
  }
  p_codec = &self->codec_;
  JreStrongAssign((id *)p_codec, a3);
}

- (id)getCodec
{
  return self->codec_;
}

- (int)maxDoc
{
  int result = self->maxDoc_;
  if (result == -1)
  {
    uint64_t v3 = new_JavaLangIllegalStateException_initWithNSString_(@"maxDoc isn't set yet");
    objc_exception_throw(v3);
  }
  return result;
}

- (void)setMaxDocWithInt:(int)a3
{
  if (self->maxDoc_ != -1)
  {
    CFStringRef v8 = JreStrcat("$I$I", (uint64_t)a2, *(uint64_t *)&a3, v3, v4, v5, v6, v7, @"maxDoc was already set: this.maxDoc=");
    v9 = new_JavaLangIllegalStateException_initWithNSString_((uint64_t)v8);
    objc_exception_throw(v9);
  }
  self->maxDoc_ = a3;
}

- (id)files
{
  setFiles = self->setFiles_;
  if (!setFiles)
  {
    uint64_t v4 = new_JavaLangIllegalStateException_initWithNSString_(@"files were not computed yet");
    objc_exception_throw(v4);
  }
  return JavaUtilCollections_unmodifiableSetWithJavaUtilSet_(setFiles);
}

- (id)description
{
  return [(OrgApacheLuceneIndexSegmentInfo *)self toStringWithInt:0];
}

- (id)toStringWithOrgApacheLuceneStoreDirectory:(id)a3 withInt:(int)a4
{
  return [(OrgApacheLuceneIndexSegmentInfo *)self toStringWithInt:*(void *)&a4];
}

- (id)toStringWithInt:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = new_JavaLangStringBuilder_init();
  id v6 = [(JavaLangStringBuilder *)v5 appendWithNSString:self->name_];
  if (!v6) {
    goto LABEL_20;
  }
  id v7 = [v6 appendWithChar:40];
  if (!v7) {
    goto LABEL_20;
  }
  CFStringRef v8 = self->version__ ? self->version__ : (OrgApacheLuceneUtilVersion *)@"?";
  id v9 = [v7 appendWithId:v8];
  if (!v9) {
    goto LABEL_20;
  }
  id v10 = [v9 appendWithChar:41];
  if (!v10) {
    goto LABEL_20;
  }
  [v10 appendWithChar:58];
  if ([(OrgApacheLuceneIndexSegmentInfo *)self getUseCompoundFile]) {
    uint64_t v11 = 99;
  }
  else {
    uint64_t v11 = 67;
  }
  [(JavaLangStringBuilder *)v5 appendWithChar:v11];
  [(JavaLangStringBuilder *)v5 appendWithInt:self->maxDoc_];
  if (v3)
  {
    id v12 = [(JavaLangStringBuilder *)v5 appendWithChar:47];
    if (!v12) {
      goto LABEL_20;
    }
    [v12 appendWithInt:v3];
  }
  diagnostics = self->diagnostics_;
  if (!diagnostics) {
LABEL_20:
  }
    JreThrowNullPointerException();
  id v14 = [(JavaUtilMap *)diagnostics getWithId:@"sorter"];
  if (v14)
  {
    id v15 = v14;
    [(JavaLangStringBuilder *)v5 appendWithNSString:@":["];
    [(JavaLangStringBuilder *)v5 appendWithNSString:@"sorter"];
    [(JavaLangStringBuilder *)v5 appendWithChar:61];
    [(JavaLangStringBuilder *)v5 appendWithNSString:v15];
    [(JavaLangStringBuilder *)v5 appendWithChar:93];
  }
  return [(JavaLangStringBuilder *)v5 description];
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  objc_opt_class();
  if (!a3) {
    goto LABEL_13;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  if ((OrgApacheLuceneStoreDirectory *)*((void *)a3 + 2) != self->dir_) {
    return 0;
  }
  id v6 = (void *)*((void *)a3 + 1);
  if (!v6) {
LABEL_13:
  }
    JreThrowNullPointerException();
  name = self->name_;
  return [v6 isEqual:name];
}

- (unint64_t)hash
{
  dir = self->dir_;
  if (!dir || (unsigned int v4 = [(OrgApacheLuceneStoreDirectory *)dir hash], (name = self->name_) == 0)) {
    JreThrowNullPointerException();
  }
  return (int)([(NSString *)name hash] + v4);
}

- (id)getVersion
{
  return self->version__;
}

- (id)getId
{
  id result = self->id__;
  if (result) {
    return [result clone];
  }
  return result;
}

- (void)setFilesWithJavaUtilCollection:(id)a3
{
  p_setFiles = &self->setFiles_;
  id v6 = new_JavaUtilHashSet_init();
  JreStrongAssignAndConsume((id *)p_setFiles, v6);
  [(OrgApacheLuceneIndexSegmentInfo *)self addFilesWithJavaUtilCollection:a3];
}

- (void)addFilesWithJavaUtilCollection:(id)a3
{
  sub_100099B5C(a3);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  if (!a3) {
LABEL_11:
  }
    JreThrowNullPointerException();
  id v5 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(a3);
        }
        setFiles = self->setFiles_;
        if (!setFiles) {
          goto LABEL_11;
        }
        -[JavaUtilSet addWithId:](setFiles, "addWithId:", -[OrgApacheLuceneIndexSegmentInfo namedForThisSegmentWithNSString:](self, "namedForThisSegmentWithNSString:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10));
      }
      id v6 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)addFileWithNSString:(id)a3
{
  id v5 = JavaUtilCollections_singletonWithId_(a3);
  sub_100099B5C(v5);
  setFiles = self->setFiles_;
  if (!setFiles) {
    JreThrowNullPointerException();
  }
  id v7 = [(OrgApacheLuceneIndexSegmentInfo *)self namedForThisSegmentWithNSString:a3];
  [(JavaUtilSet *)setFiles addWithId:v7];
}

- (void)checkFileNamesWithJavaUtilCollection:(id)a3
{
}

- (id)namedForThisSegmentWithNSString:(id)a3
{
  name = self->name_;
  OrgApacheLuceneIndexIndexFileNames_stripSegmentNameWithNSString_(a3);
  return (id)JreStrcat("$$", v4, v5, v6, v7, v8, v9, v10, name);
}

- (id)getAttributeWithNSString:(id)a3
{
  attributes = self->attributes_;
  if (!attributes) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilMap *)attributes getWithId:a3];
}

- (id)putAttributeWithNSString:(id)a3 withNSString:(id)a4
{
  attributes = self->attributes_;
  if (!attributes) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilMap *)attributes putWithId:a3 withId:a4];
}

- (id)getAttributes
{
  return self->attributes_;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneIndexSegmentInfo;
  [(OrgApacheLuceneIndexSegmentInfo *)&v3 dealloc];
}

@end