@interface NSManagedObject
@end

@implementation NSManagedObject

uint64_t __48__NSManagedObject_Accounts___obsoleteAttributes__block_invoke()
{
  __sACDObsoleteAttributes = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"credentialAvailability", @"owningTeamID", 0);

  return MEMORY[0x1F41817F8]();
}

@end