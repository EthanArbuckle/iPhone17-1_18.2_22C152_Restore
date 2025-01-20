@interface OrgApacheLuceneUtilAutomatonTransition
- (OrgApacheLuceneUtilAutomatonTransition)init;
- (id)description;
@end

@implementation OrgApacheLuceneUtilAutomatonTransition

- (OrgApacheLuceneUtilAutomatonTransition)init
{
  self->transitionUpto_ = -1;
  return self;
}

- (id)description
{
  return (id)JreStrcat("I$ICCCC", (uint64_t)a2, v2, v3, v4, v5, v6, v7, self->source_);
}

@end