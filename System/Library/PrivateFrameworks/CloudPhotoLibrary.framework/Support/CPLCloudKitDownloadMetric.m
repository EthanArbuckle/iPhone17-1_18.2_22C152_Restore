@interface CPLCloudKitDownloadMetric
- (CPLCloudKitDownloadMetric)init;
- (id)description;
- (unint64_t)downloadedItemCount;
- (unint64_t)downloadedSize;
- (unint64_t)expectedSize;
- (unint64_t)requestedItemCount;
- (unint64_t)transcodedItemCount;
- (void)prepareCKEventMetric:(id)a3;
- (void)setDownloadedItemCount:(unint64_t)a3;
- (void)setDownloadedSize:(unint64_t)a3;
- (void)setExpectedSize:(unint64_t)a3;
- (void)setRequestedItemCount:(unint64_t)a3;
- (void)setTranscodedItemCount:(unint64_t)a3;
@end

@implementation CPLCloudKitDownloadMetric

- (CPLCloudKitDownloadMetric)init
{
  v3.receiver = self;
  v3.super_class = (Class)CPLCloudKitDownloadMetric;
  return [(CPLCloudKitMetric *)&v3 initWithName:@"resourcesDownload"];
}

- (void)prepareCKEventMetric:(id)a3
{
  unint64_t requestedItemCount = self->_requestedItemCount;
  id v5 = a3;
  v6 = +[NSNumber numberWithUnsignedInteger:requestedItemCount];
  [v5 setObject:v6 forKeyedSubscript:@"requestedCount"];

  v7 = +[NSNumber numberWithUnsignedLongLong:self->_expectedSize];
  [v5 setObject:v7 forKeyedSubscript:@"expectedSize"];

  v8 = +[NSNumber numberWithUnsignedInteger:self->_downloadedItemCount];
  [v5 setObject:v8 forKeyedSubscript:@"downloadedCount"];

  v9 = +[NSNumber numberWithUnsignedLongLong:self->_downloadedSize];
  [v5 setObject:v9 forKeyedSubscript:@"downloadedSize"];

  id v10 = +[NSNumber numberWithUnsignedInteger:self->_transcodedItemCount];
  [v5 setObject:v10 forKeyedSubscript:@"transcodedCount"];
}

- (id)description
{
  if (self->_requestedItemCount)
  {
    if (self->_downloadedItemCount || [(CPLCloudKitMetric *)self result])
    {
      id v3 = objc_alloc((Class)NSString);
      v4 = [(CPLCloudKitMetric *)self identifier];
      unint64_t requestedItemCount = self->_requestedItemCount;
      v6 = +[NSByteCountFormatter stringFromByteCount:self->_expectedSize countStyle:3];
      unint64_t downloadedItemCount = self->_downloadedItemCount;
      v8 = +[NSByteCountFormatter stringFromByteCount:self->_downloadedSize countStyle:3];
      v9 = [(CPLCloudKitMetric *)self resultDescription];
      id v10 = [v3 initWithFormat:@"<%@ (%lu/%@ -> %lu/%@)%@>", v4, requestedItemCount, v6, downloadedItemCount, v8, v9];
    }
    else
    {
      id v11 = objc_alloc((Class)NSString);
      v12 = [(CPLCloudKitMetric *)self identifier];
      unint64_t v13 = self->_requestedItemCount;
      v14 = +[NSByteCountFormatter stringFromByteCount:self->_expectedSize countStyle:3];
      id v10 = [v11 initWithFormat:@"<%@ (%lu/%@)>", v12, v13, v14];
    }
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)CPLCloudKitDownloadMetric;
    id v10 = [(CPLCloudKitMetric *)&v16 description];
  }
  return v10;
}

- (unint64_t)requestedItemCount
{
  return self->_requestedItemCount;
}

- (void)setRequestedItemCount:(unint64_t)a3
{
  self->_unint64_t requestedItemCount = a3;
}

- (unint64_t)expectedSize
{
  return self->_expectedSize;
}

- (void)setExpectedSize:(unint64_t)a3
{
  self->_expectedSize = a3;
}

- (unint64_t)downloadedItemCount
{
  return self->_downloadedItemCount;
}

- (void)setDownloadedItemCount:(unint64_t)a3
{
  self->_unint64_t downloadedItemCount = a3;
}

- (unint64_t)downloadedSize
{
  return self->_downloadedSize;
}

- (void)setDownloadedSize:(unint64_t)a3
{
  self->_downloadedSize = a3;
}

- (unint64_t)transcodedItemCount
{
  return self->_transcodedItemCount;
}

- (void)setTranscodedItemCount:(unint64_t)a3
{
  self->_transcodedItemCount = a3;
}

@end