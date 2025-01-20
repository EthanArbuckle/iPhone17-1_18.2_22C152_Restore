@interface IMDCoreSpotlightMessageSubjectIndexer
+ (void)indexItem:(id)a3 withChat:(id)a4 isReindexing:(BOOL)a5 metadataToUpdate:(id)a6 timingProfiler:(id)a7;
@end

@implementation IMDCoreSpotlightMessageSubjectIndexer

+ (void)indexItem:(id)a3 withChat:(id)a4 isReindexing:(BOOL)a5 metadataToUpdate:(id)a6 timingProfiler:(id)a7
{
  id v9 = a6;
  v8 = [a3 objectForKey:@"subject"];
  if ([v8 length]) {
    [v9 setTitle:v8];
  }
}

@end