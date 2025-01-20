@interface OrgApacheLuceneStoreMergeInfo
- (BOOL)isEqual:(id)a3;
- (OrgApacheLuceneStoreMergeInfo)initWithInt:(int)a3 withLong:(int64_t)a4 withBoolean:(BOOL)a5 withInt:(int)a6;
- (id)description;
- (unint64_t)hash;
@end

@implementation OrgApacheLuceneStoreMergeInfo

- (OrgApacheLuceneStoreMergeInfo)initWithInt:(int)a3 withLong:(int64_t)a4 withBoolean:(BOOL)a5 withInt:(int)a6
{
  self->totalMaxDoc_ = a3;
  self->estimatedMergeBytes_ = a4;
  self->isExternal_ = a5;
  self->mergeMaxNumSegments_ = a6;
  return self;
}

- (unint64_t)hash
{
  if (self->isExternal_) {
    int v3 = 2192;
  }
  else {
    int v3 = 2198;
  }
  int v2 = HIDWORD(self->estimatedMergeBytes_) ^ LODWORD(self->estimatedMergeBytes_);
  int v4 = self->mergeMaxNumSegments_ - (v3 - v2 + 32 * v2) + 32 * (v3 - v2 + 32 * v2);
  return self->totalMaxDoc_ - v4 + 32 * v4;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  if (a3)
  {
    id v5 = [(OrgApacheLuceneStoreMergeInfo *)self getClass];
    if (v5 == [a3 getClass])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        JreThrowClassCastException();
      }
      if (self->estimatedMergeBytes_ == *((void *)a3 + 2)
        && self->isExternal_ == *((unsigned __int8 *)a3 + 24)
        && self->mergeMaxNumSegments_ == *((_DWORD *)a3 + 7))
      {
        return self->totalMaxDoc_ == *((_DWORD *)a3 + 2);
      }
    }
  }
  return 0;
}

- (id)description
{
  return (id)JreStrcat("$I$J$Z$IC", (uint64_t)a2, v2, v3, v4, v5, v6, v7, @"MergeInfo [totalMaxDoc=");
}

@end