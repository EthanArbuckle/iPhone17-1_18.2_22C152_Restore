@interface ENExposureDetectionHistoryCheck
- (ENExposureDetectionHistoryCheck)init;
- (ENExposureDetectionHistorySession)session;
- (NSArray)files;
- (void)setFiles:(id)a3;
- (void)setSession:(id)a3;
@end

@implementation ENExposureDetectionHistoryCheck

- (ENExposureDetectionHistoryCheck)init
{
  v7.receiver = self;
  v7.super_class = (Class)ENExposureDetectionHistoryCheck;
  v2 = [(ENExposureDetectionHistoryCheck *)&v7 init];
  v3 = v2;
  if (v2)
  {
    files = v2->_files;
    v2->_files = (NSArray *)MEMORY[0x263EFFA68];

    v5 = v3;
  }

  return v3;
}

- (NSArray)files
{
  return self->_files;
}

- (void)setFiles:(id)a3
{
}

- (ENExposureDetectionHistorySession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);

  objc_storeStrong((id *)&self->_files, 0);
}

@end