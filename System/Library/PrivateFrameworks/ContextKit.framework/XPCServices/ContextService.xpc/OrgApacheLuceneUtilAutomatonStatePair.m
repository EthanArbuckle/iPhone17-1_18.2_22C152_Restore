@interface OrgApacheLuceneUtilAutomatonStatePair
- (BOOL)isEqual:(id)a3;
- (OrgApacheLuceneUtilAutomatonStatePair)initWithInt:(int)a3 withInt:(int)a4;
- (OrgApacheLuceneUtilAutomatonStatePair)initWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5;
- (id)description;
- (unint64_t)hash;
@end

@implementation OrgApacheLuceneUtilAutomatonStatePair

- (OrgApacheLuceneUtilAutomatonStatePair)initWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5
{
  self->s_ = a3;
  self->s1_ = a4;
  self->s2_ = a5;
  return self;
}

- (OrgApacheLuceneUtilAutomatonStatePair)initWithInt:(int)a3 withInt:(int)a4
{
  self->s1_ = a3;
  self->s2_ = a4;
  self->s_ = -1;
  return self;
}

- (BOOL)isEqual:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  objc_opt_class();
  if (!a3) {
    JreThrowNullPointerException();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  return *((_DWORD *)a3 + 3) == self->s1_ && *((_DWORD *)a3 + 4) == self->s2_;
}

- (unint64_t)hash
{
  return self->s2_ ^ self->s1_;
}

- (id)description
{
  return (id)JreStrcat("$I$IC", (uint64_t)a2, v2, v3, v4, v5, v6, v7, @"StatePair(s1=");
}

@end