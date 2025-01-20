@interface ATXLinkTranscriptUtil
+ (id)linkTranscriptPublisherForBundleId:(id)a3 fromDate:(id)a4 toDate:(id)a5 maxEvents:(id)a6 reversed:(BOOL)a7 error:(id *)a8;
+ (id)systemLinkTranscriptPublisherFromDate:(id)a3 toDate:(id)a4 error:(id *)a5;
@end

@implementation ATXLinkTranscriptUtil

+ (id)systemLinkTranscriptPublisherFromDate:(id)a3 toDate:(id)a4 error:(id *)a5
{
  v7 = (objc_class *)MEMORY[0x1E4F72DF0];
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc_init(v7);
  v11 = [v10 transcriptPublisherWithStreamName:@"System" fromDate:v9 toDate:v8 maxEvents:0 reversed:0 error:a5];

  return v11;
}

+ (id)linkTranscriptPublisherForBundleId:(id)a3 fromDate:(id)a4 toDate:(id)a5 maxEvents:(id)a6 reversed:(BOOL)a7 error:(id *)a8
{
  BOOL v9 = a7;
  v13 = (objc_class *)MEMORY[0x1E4F72DF0];
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  id v18 = objc_alloc_init(v13);
  v19 = [v18 transcriptPublisherWithStreamName:v17 fromDate:v16 toDate:v15 maxEvents:v14 reversed:v9 error:a8];

  return v19;
}

@end