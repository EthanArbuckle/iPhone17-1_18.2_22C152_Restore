@interface OrgApacheLuceneCodecsCompressingCompressingStoredFieldsReader
+ (double)readZDoubleWithOrgApacheLuceneStoreDataInput:(id)a3;
+ (float)readZFloatWithOrgApacheLuceneStoreDataInput:(id)a3;
+ (int64_t)readTLongWithOrgApacheLuceneStoreDataInput:(id)a3;
- (OrgApacheLuceneCodecsCompressingCompressingStoredFieldsReader)initWithOrgApacheLuceneCodecsCompressingCompressingStoredFieldsReader:(id)a3 withBoolean:(BOOL)a4;
- (OrgApacheLuceneCodecsCompressingCompressingStoredFieldsReader)initWithOrgApacheLuceneStoreDirectory:(id)a3 withOrgApacheLuceneIndexSegmentInfo:(id)a4 withNSString:(id)a5 withOrgApacheLuceneIndexFieldInfos:(id)a6 withOrgApacheLuceneStoreIOContext:(id)a7 withNSString:(id)a8 withOrgApacheLuceneCodecsCompressingCompressionMode:(id)a9;
- (id)clone;
- (id)description;
- (id)documentWithInt:(int)a3;
- (id)getChildResources;
- (id)getCompressionMode;
- (id)getFieldsStream;
- (id)getIndexReader;
- (id)getMergeInstance;
- (int)getChunkSize;
- (int)getPackedIntsVersion;
- (int)getVersion;
- (int64_t)getMaxPointer;
- (int64_t)getNumChunks;
- (int64_t)getNumDirtyChunks;
- (int64_t)ramBytesUsed;
- (void)checkIntegrity;
- (void)close;
- (void)dealloc;
- (void)visitDocumentWithInt:(int)a3 withOrgApacheLuceneIndexStoredFieldVisitor:(id)a4;
@end

@implementation OrgApacheLuceneCodecsCompressingCompressingStoredFieldsReader

- (OrgApacheLuceneCodecsCompressingCompressingStoredFieldsReader)initWithOrgApacheLuceneCodecsCompressingCompressingStoredFieldsReader:(id)a3 withBoolean:(BOOL)a4
{
  return self;
}

- (OrgApacheLuceneCodecsCompressingCompressingStoredFieldsReader)initWithOrgApacheLuceneStoreDirectory:(id)a3 withOrgApacheLuceneIndexSegmentInfo:(id)a4 withNSString:(id)a5 withOrgApacheLuceneIndexFieldInfos:(id)a6 withOrgApacheLuceneStoreIOContext:(id)a7 withNSString:(id)a8 withOrgApacheLuceneCodecsCompressingCompressionMode:(id)a9
{
  return self;
}

- (void)close
{
  if (!self->closed_)
  {
    fieldsStream = self->fieldsStream_;
    v3 = +[IOSObjectArray arrayWithObjects:&fieldsStream count:1 type:JavaIoCloseable_class_()];
    OrgApacheLuceneUtilIOUtils_closeWithJavaIoCloseableArray_(v3);
    self->closed_ = 1;
  }
}

+ (float)readZFloatWithOrgApacheLuceneStoreDataInput:(id)a3
{
  return OrgApacheLuceneCodecsCompressingCompressingStoredFieldsReader_readZFloatWithOrgApacheLuceneStoreDataInput_(a3);
}

+ (double)readZDoubleWithOrgApacheLuceneStoreDataInput:(id)a3
{
  return OrgApacheLuceneCodecsCompressingCompressingStoredFieldsReader_readZDoubleWithOrgApacheLuceneStoreDataInput_(a3);
}

+ (int64_t)readTLongWithOrgApacheLuceneStoreDataInput:(id)a3
{
  return OrgApacheLuceneCodecsCompressingCompressingStoredFieldsReader_readTLongWithOrgApacheLuceneStoreDataInput_(a3);
}

- (id)documentWithInt:(int)a3
{
  state = self->state_;
  if (!state) {
    goto LABEL_9;
  }
  uint64_t v5 = *(void *)&a3;
  if (-[OrgApacheLuceneCodecsCompressingCompressingStoredFieldsReader_BlockState containsWithInt:](state, "containsWithInt:"))
  {
    goto LABEL_6;
  }
  fieldsStream = self->fieldsStream_;
  if (!fieldsStream || (indexReader = self->indexReader_) == 0) {
LABEL_9:
  }
    JreThrowNullPointerException();
  [(OrgApacheLuceneStoreIndexInput *)fieldsStream seekWithLong:[(OrgApacheLuceneCodecsCompressingCompressingStoredFieldsIndexReader *)indexReader getStartPointerWithInt:v5]];
  [(OrgApacheLuceneCodecsCompressingCompressingStoredFieldsReader_BlockState *)self->state_ resetWithInt:v5];
LABEL_6:
  v8 = self->state_;
  return [(OrgApacheLuceneCodecsCompressingCompressingStoredFieldsReader_BlockState *)v8 documentWithInt:v5];
}

- (void)visitDocumentWithInt:(int)a3 withOrgApacheLuceneIndexStoredFieldVisitor:(id)a4
{
  v6 = [(OrgApacheLuceneCodecsCompressingCompressingStoredFieldsReader *)self documentWithInt:*(void *)&a3];
  if (!v6) {
    goto LABEL_41;
  }
  v7 = v6;
  if (v6[5] >= 1)
  {
    int v8 = 0;
    v9 = &OBJC_IVAR___OrgApacheLuceneUtilCloseableThreadLocal_t_;
    while (1)
    {
      v10 = (void *)*((void *)v7 + 1);
      if (!v10) {
        break;
      }
      unint64_t v11 = (unint64_t)[v10 readVLong];
      if ((atomic_load_explicit(OrgApacheLuceneCodecsCompressingCompressingStoredFieldsWriter__initialized, memory_order_acquire) & 1) == 0)objc_opt_class(); {
      v12 = *(Class *)((char *)&self->super.super.isa + v9[546]);
      }
      if (!v12) {
        break;
      }
      id v13 = [v12 fieldInfoWithInt:v11 >> OrgApacheLuceneCodecsCompressingCompressingStoredFieldsWriter_TYPE_BITS_];
      if (atomic_load_explicit(OrgApacheLuceneCodecsCompressingCompressingStoredFieldsWriter__initialized, memory_order_acquire))
      {
        if (!a4) {
          break;
        }
      }
      else
      {
        objc_opt_class();
        if (!a4) {
          break;
        }
      }
      unsigned int v14 = OrgApacheLuceneCodecsCompressingCompressingStoredFieldsWriter_TYPE_MASK_ & v11;
      unsigned int v15 = objc_msgSend(objc_msgSend(a4, "needsFieldWithOrgApacheLuceneIndexFieldInfo:", v13), "ordinal");
      if (v15)
      {
        if (v15 == 1)
        {
          v20 = (void *)*((void *)v7 + 1);
          if ((atomic_load_explicit(OrgApacheLuceneCodecsCompressingCompressingStoredFieldsWriter__initialized, memory_order_acquire) & 1) == 0)objc_opt_class(); {
          switch(OrgApacheLuceneCodecsCompressingCompressingStoredFieldsWriter_TYPE_MASK_ & v14)
          }
          {
            case 0u:
            case 1u:
              if (!v20) {
                goto LABEL_41;
              }
              objc_msgSend(v20, "skipBytesWithLong:", (int)objc_msgSend(v20, "readVInt"));
              break;
            case 2u:
              if (!v20) {
                goto LABEL_41;
              }
              [v20 readZInt];
              break;
            case 3u:
              OrgApacheLuceneCodecsCompressingCompressingStoredFieldsReader_readZFloatWithOrgApacheLuceneStoreDataInput_(v20);
              break;
            case 4u:
              OrgApacheLuceneCodecsCompressingCompressingStoredFieldsReader_readTLongWithOrgApacheLuceneStoreDataInput_(v20);
              break;
            case 5u:
              OrgApacheLuceneCodecsCompressingCompressingStoredFieldsReader_readZDoubleWithOrgApacheLuceneStoreDataInput_(v20);
              break;
            default:
              goto LABEL_42;
          }
        }
        else if (v15 == 2)
        {
          return;
        }
      }
      else
      {
        v16 = (void *)*((void *)v7 + 1);
        if ((atomic_load_explicit(OrgApacheLuceneCodecsCompressingCompressingStoredFieldsWriter__initialized, memory_order_acquire) & 1) == 0)objc_opt_class(); {
        switch(OrgApacheLuceneCodecsCompressingCompressingStoredFieldsWriter_TYPE_MASK_ & v14)
        }
        {
          case 0u:
            if (!v16) {
              goto LABEL_41;
            }
            id v17 = [v16 readVInt];
            v18 = +[IOSByteArray arrayWithLength:(int)v17];
            [v16 readBytesWithByteArray:v18 withInt:0 withInt:v17];
            v19 = v18;
            v9 = &OBJC_IVAR___OrgApacheLuceneUtilCloseableThreadLocal_t_;
            [a4 stringFieldWithOrgApacheLuceneIndexFieldInfo:v13 withByteArray:v19];
            break;
          case 1u:
            if (!v16) {
              goto LABEL_41;
            }
            id v21 = [v16 readVInt];
            v22 = +[IOSByteArray arrayWithLength:(int)v21];
            [v16 readBytesWithByteArray:v22 withInt:0 withInt:v21];
            v23 = v22;
            v9 = &OBJC_IVAR___OrgApacheLuceneUtilCloseableThreadLocal_t_;
            [a4 binaryFieldWithOrgApacheLuceneIndexFieldInfo:v13 withByteArray:v23];
            break;
          case 2u:
            if (!v16) {
              goto LABEL_41;
            }
            objc_msgSend(a4, "intFieldWithOrgApacheLuceneIndexFieldInfo:withInt:", v13, objc_msgSend(v16, "readZInt"));
            break;
          case 3u:
            *(float *)&double v24 = OrgApacheLuceneCodecsCompressingCompressingStoredFieldsReader_readZFloatWithOrgApacheLuceneStoreDataInput_(v16);
            [a4 floatFieldWithOrgApacheLuceneIndexFieldInfo:v13 withFloat:v24];
            break;
          case 4u:
            [a4 longFieldWithOrgApacheLuceneIndexFieldInfo:v13 withLong:OrgApacheLuceneCodecsCompressingCompressingStoredFieldsReader_readTLongWithOrgApacheLuceneStoreDataInput_(v16)];
            break;
          case 5u:
            [a4 doubleFieldWithOrgApacheLuceneIndexFieldInfo:v13 withDouble:OrgApacheLuceneCodecsCompressingCompressingStoredFieldsReader_readZDoubleWithOrgApacheLuceneStoreDataInput_(v16)];
            break;
          default:
LABEL_42:
            JavaLangInteger_toHexStringWithInt_(v14);
            v32 = (__CFString *)JreStrcat("$$", v25, v26, v27, v28, v29, v30, v31, @"Unknown type flag: ");
            v33 = new_JavaLangAssertionError_initWithId_(v32);
            objc_exception_throw(v33);
        }
      }
      if (++v8 >= v7[5]) {
        return;
      }
    }
LABEL_41:
    JreThrowNullPointerException();
  }
}

- (id)clone
{
  sub_1000A9D88((uint64_t)self);
  v3 = [OrgApacheLuceneCodecsCompressingCompressingStoredFieldsReader alloc];
  sub_1000A9618((uint64_t)v3, (uint64_t)self, 0);
  return v3;
}

- (id)getMergeInstance
{
  sub_1000A9D88((uint64_t)self);
  v3 = [OrgApacheLuceneCodecsCompressingCompressingStoredFieldsReader alloc];
  sub_1000A9618((uint64_t)v3, (uint64_t)self, 1);
  return v3;
}

- (int)getVersion
{
  return self->version__;
}

- (id)getCompressionMode
{
  return self->compressionMode_;
}

- (id)getIndexReader
{
  return self->indexReader_;
}

- (int64_t)getMaxPointer
{
  return self->maxPointer_;
}

- (id)getFieldsStream
{
  return self->fieldsStream_;
}

- (int)getChunkSize
{
  return self->chunkSize_;
}

- (int64_t)getNumChunks
{
  return self->numChunks_;
}

- (int64_t)getNumDirtyChunks
{
  return self->numDirtyChunks_;
}

- (int)getPackedIntsVersion
{
  return self->packedIntsVersion_;
}

- (int64_t)ramBytesUsed
{
  indexReader = self->indexReader_;
  if (!indexReader) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneCodecsCompressingCompressingStoredFieldsIndexReader *)indexReader ramBytesUsed];
}

- (id)getChildResources
{
  int v8 = OrgApacheLuceneUtilAccountables_namedAccountableWithNSString_withOrgApacheLuceneUtilAccountable_(@"stored field index", self->indexReader_, v2, v3, v4, v5, v6, v7);
  return JavaUtilCollections_singletonWithId_(v8);
}

- (void)checkIntegrity
{
}

- (id)description
{
  id v2 = objc_msgSend(-[OrgApacheLuceneCodecsCompressingCompressingStoredFieldsReader getClass](self, "getClass"), "getSimpleName");
  return (id)JreStrcat("$$@$IC", v3, v4, v5, v6, v7, v8, v9, v2);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneCodecsCompressingCompressingStoredFieldsReader;
  [(OrgApacheLuceneCodecsCompressingCompressingStoredFieldsReader *)&v3 dealloc];
}

@end