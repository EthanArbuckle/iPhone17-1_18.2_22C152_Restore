@interface NSPredicate
@end

@implementation NSPredicate

uint64_t __58__NSPredicate_MediaGroupsDaemon__mg_requiresCurrentDevice__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "mg_containsCurrentDevice");
}

uint64_t __60__NSPredicate_MediaGroupsDaemon__mg_restrictedToContainment__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "mg_containsContainment");
}

uint64_t __48__NSPredicate_RemoteQuery__rq_restrictedToLocal__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "rq_containsLocal");
}

@end