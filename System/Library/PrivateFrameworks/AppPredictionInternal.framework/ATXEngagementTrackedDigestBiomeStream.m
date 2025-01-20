@interface ATXEngagementTrackedDigestBiomeStream
- (ATXEngagementTrackedDigestBiomeStream)init;
- (id)initFromCompletedDigestBiomeStream:(id)a3;
- (id)initFromCompletedDigestBiomeStream:(id)a3 resolutionSource:(id)a4;
- (id)publisherFromStartTime:(double)a3;
@end

@implementation ATXEngagementTrackedDigestBiomeStream

- (ATXEngagementTrackedDigestBiomeStream)init
{
  v3 = objc_opt_new();
  v4 = [(ATXEngagementTrackedDigestBiomeStream *)self initFromCompletedDigestBiomeStream:v3];

  return v4;
}

- (id)initFromCompletedDigestBiomeStream:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  [v5 updateDatabase];
  id v6 = [(ATXEngagementTrackedDigestBiomeStream *)self initFromCompletedDigestBiomeStream:v4 resolutionSource:v5];

  return v6;
}

- (id)initFromCompletedDigestBiomeStream:(id)a3 resolutionSource:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXEngagementTrackedDigestBiomeStream;
  v9 = [(ATXEngagementTrackedDigestBiomeStream *)&v12 init];
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_completedDigestStream, a3);
    objc_storeStrong(p_isa + 2, a4);
  }

  return p_isa;
}

- (id)publisherFromStartTime:(double)a3
{
  id v4 = [(ATXCompletedDigestBiomeStream *)self->_completedDigestStream publisherFromStartTime:a3];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__ATXEngagementTrackedDigestBiomeStream_publisherFromStartTime___block_invoke;
  v7[3] = &unk_1E68ADB78;
  v7[4] = self;
  v5 = [v4 mapWithTransform:v7];

  return v5;
}

id __64__ATXEngagementTrackedDigestBiomeStream_publisherFromStartTime___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 populateEngagementFromSource:*(void *)(*(void *)(a1 + 32) + 16)];
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolutionSource, 0);
  objc_storeStrong((id *)&self->_completedDigestStream, 0);
}

@end