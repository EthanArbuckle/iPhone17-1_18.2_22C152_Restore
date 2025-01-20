@interface HDCodableClinicalDeletedAccount
- (int64_t)safeDeletionReason;
@end

@implementation HDCodableClinicalDeletedAccount

- (int64_t)safeDeletionReason
{
  if (![(HDCodableClinicalDeletedAccount *)self hasDeletionReason]) {
    return 0;
  }

  return (int64_t)[(HDCodableClinicalDeletedAccount *)self deletionReason];
}

@end