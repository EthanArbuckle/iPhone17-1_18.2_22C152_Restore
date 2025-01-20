@interface OrgApacheLuceneStoreMMapDirectory
+ (void)initialize;
- (BOOL)getPreload;
- (BOOL)getUseUnmap;
- (OrgApacheLuceneStoreMMapDirectory)initWithOrgLukhnosPortmobileFilePath:(id)a3;
- (OrgApacheLuceneStoreMMapDirectory)initWithOrgLukhnosPortmobileFilePath:(id)a3 withInt:(int)a4;
- (OrgApacheLuceneStoreMMapDirectory)initWithOrgLukhnosPortmobileFilePath:(id)a3 withOrgApacheLuceneStoreLockFactory:(id)a4;
- (OrgApacheLuceneStoreMMapDirectory)initWithOrgLukhnosPortmobileFilePath:(id)a3 withOrgApacheLuceneStoreLockFactory:(id)a4 withInt:(int)a5;
- (id)convertMapFailedIOExceptionWithJavaIoIOException:(id)a3 withNSString:(id)a4 withInt:(int)a5;
- (id)mapWithNSString:(id)a3 withJavaNioChannelsFileChannel:(id)a4 withLong:(int64_t)a5 withLong:(int64_t)a6;
- (id)openInputWithNSString:(id)a3 withOrgApacheLuceneStoreIOContext:(id)a4;
- (int)getMaxChunkSize;
- (void)setPreloadWithBoolean:(BOOL)a3;
- (void)setUseUnmapWithBoolean:(BOOL)a3;
@end

@implementation OrgApacheLuceneStoreMMapDirectory

- (OrgApacheLuceneStoreMMapDirectory)initWithOrgLukhnosPortmobileFilePath:(id)a3 withOrgApacheLuceneStoreLockFactory:(id)a4
{
  return self;
}

- (OrgApacheLuceneStoreMMapDirectory)initWithOrgLukhnosPortmobileFilePath:(id)a3
{
  Default = (void *)OrgApacheLuceneStoreFSLockFactory_getDefault();
  OrgApacheLuceneStoreMMapDirectory_initWithOrgLukhnosPortmobileFilePath_withOrgApacheLuceneStoreLockFactory_withInt_((uint64_t)self, a3, Default, OrgApacheLuceneStoreMMapDirectory_DEFAULT_MAX_CHUNK_SIZE_);
  return self;
}

- (OrgApacheLuceneStoreMMapDirectory)initWithOrgLukhnosPortmobileFilePath:(id)a3 withInt:(int)a4
{
  Default = (void *)OrgApacheLuceneStoreFSLockFactory_getDefault();
  OrgApacheLuceneStoreMMapDirectory_initWithOrgLukhnosPortmobileFilePath_withOrgApacheLuceneStoreLockFactory_withInt_((uint64_t)self, a3, Default, a4);
  return self;
}

- (OrgApacheLuceneStoreMMapDirectory)initWithOrgLukhnosPortmobileFilePath:(id)a3 withOrgApacheLuceneStoreLockFactory:(id)a4 withInt:(int)a5
{
  return self;
}

- (void)setUseUnmapWithBoolean:(BOOL)a3
{
  if (a3 && !OrgApacheLuceneStoreMMapDirectory_UNMAP_SUPPORTED_)
  {
    v3 = new_JavaLangIllegalArgumentException_initWithNSString_(@"Unmap hack not supported on this platform!");
    objc_exception_throw(v3);
  }
  self->useUnmapHack_ = a3;
}

- (BOOL)getUseUnmap
{
  return self->useUnmapHack_;
}

- (void)setPreloadWithBoolean:(BOOL)a3
{
  self->preload_ = a3;
}

- (BOOL)getPreload
{
  return self->preload_;
}

- (int)getMaxChunkSize
{
  return 1 << self->chunkSizePower_;
}

- (id)openInputWithNSString:(id)a3 withOrgApacheLuceneStoreIOContext:(id)a4
{
  [(OrgApacheLuceneStoreBaseDirectory *)self ensureOpen];
  directory = self->super.directory_;
  if (!directory) {
    JreThrowNullPointerException();
  }
  id v7 = [(OrgLukhnosPortmobileFilePath *)directory resolveWithNSString:a3];
  if ((atomic_load_explicit(OrgLukhnosPortmobileFileStandardOpenOptionEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  uint64_t v29 = OrgLukhnosPortmobileFileStandardOpenOptionEnum_values_[0];
  v8 = +[IOSObjectArray arrayWithObjects:&v29 count:1 type:OrgLukhnosPortmobileFileStandardOpenOptionEnum_class_()];
  id v9 = OrgLukhnosPortmobileChannelsUtilsFileChannelUtils_openWithOrgLukhnosPortmobileFilePath_withOrgLukhnosPortmobileFileStandardOpenOptionEnumArray_(v7, v8);
  if (!v7) {
    JreThrowNullPointerException();
  }
  [v7 description];
  v17 = (__CFString *)JreStrcat("$$$", v10, v11, v12, v13, v14, v15, v16, @"MMapIndexInput(path=\"");
  unsigned int v18 = [(OrgApacheLuceneStoreMMapDirectory *)self getUseUnmap];
  if (!v9) {
    JreThrowNullPointerException();
  }
  int v19 = v18;
  id v20 = [v9 size];
  v24 = sub_100074E7C((uint64_t)self, (uint64_t)v17, v9, 0, (unint64_t)v20, v21, v22, v23);
  id v25 = [v9 size];
  if (v19) {
    v26 = (void *)qword_10055FFB8;
  }
  else {
    v26 = 0;
  }
  v27 = OrgApacheLuceneStoreByteBufferIndexInput_newInstanceWithNSString_withJavaNioByteBufferArray_withLong_withInt_withOrgApacheLuceneStoreByteBufferIndexInput_BufferCleaner_withBoolean_(v17, (uint64_t)v24, (uint64_t)v25, self->chunkSizePower_, v26, v19);
  [v9 close];
  return v27;
}

- (id)mapWithNSString:(id)a3 withJavaNioChannelsFileChannel:(id)a4 withLong:(int64_t)a5 withLong:(int64_t)a6
{
  return sub_100074E7C((uint64_t)self, (uint64_t)a3, a4, a5, a6, a6, v6, v7);
}

- (id)convertMapFailedIOExceptionWithJavaIoIOException:(id)a3 withNSString:(id)a4 withInt:(int)a5
{
  return sub_10007506C(a3, (uint64_t)a4, a5);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    if ((atomic_load_explicit(OrgApacheLuceneUtilConstants__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    if (OrgApacheLuceneUtilConstants_JRE_IS_64BIT_) {
      int v2 = 0x40000000;
    }
    else {
      int v2 = 0x10000000;
    }
    OrgApacheLuceneStoreMMapDirectory_DEFAULT_MAX_CHUNK_SIZE_ = v2;
    id v3 = JavaSecurityAccessController_doPrivilegedWithJavaSecurityPrivilegedAction_([OrgApacheLuceneStoreMMapDirectory__1 alloc]);
    if (!v3) {
      JreThrowNullPointerException();
    }
    OrgApacheLuceneStoreMMapDirectory_UNMAP_SUPPORTED_ = [v3 BOOLeanValue];
    JreStrongAssignAndConsume((id *)&qword_10055FFB8, [OrgApacheLuceneStoreMMapDirectory__2 alloc]);
    atomic_store(1u, (unsigned __int8 *)&OrgApacheLuceneStoreMMapDirectory__initialized);
  }
}

@end