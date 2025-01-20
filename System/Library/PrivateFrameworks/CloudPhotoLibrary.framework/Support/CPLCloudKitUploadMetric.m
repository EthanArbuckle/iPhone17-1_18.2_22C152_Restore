@interface CPLCloudKitUploadMetric
- (CPLCloudKitUploadMetric)init;
- (id)description;
- (unint64_t)itemCount;
- (unint64_t)otherItemCount;
- (unint64_t)referencedResourcesCount;
- (unint64_t)referencedResourcesSize;
- (unint64_t)uploadSize;
- (unint64_t)uploadedSize;
- (void)prepareCKEventMetric:(id)a3;
- (void)setItemCount:(unint64_t)a3;
- (void)setOtherItemCount:(unint64_t)a3;
- (void)setReferencedResourcesCount:(unint64_t)a3;
- (void)setReferencedResourcesSize:(unint64_t)a3;
- (void)setUploadSize:(unint64_t)a3;
- (void)setUploadedSize:(unint64_t)a3;
@end

@implementation CPLCloudKitUploadMetric

- (CPLCloudKitUploadMetric)init
{
  v3.receiver = self;
  v3.super_class = (Class)CPLCloudKitUploadMetric;
  return [(CPLCloudKitMetric *)&v3 initWithName:@"batchUpload"];
}

- (void)prepareCKEventMetric:(id)a3
{
  unint64_t itemCount = self->_itemCount;
  id v5 = a3;
  v6 = +[NSNumber numberWithUnsignedInteger:itemCount];
  [v5 setObject:v6 forKeyedSubscript:@"itemCount"];

  v7 = +[NSNumber numberWithUnsignedLongLong:self->_uploadSize];
  [v5 setObject:v7 forKeyedSubscript:@"uploadsize"];

  v8 = +[NSNumber numberWithUnsignedLongLong:self->_referencedResourcesCount];
  [v5 setObject:v8 forKeyedSubscript:@"referencedResourcesCount"];

  v9 = +[NSNumber numberWithUnsignedLongLong:self->_referencedResourcesSize];
  [v5 setObject:v9 forKeyedSubscript:@"referencedSize"];

  v10 = +[NSNumber numberWithUnsignedInteger:self->_otherItemCount];
  [v5 setObject:v10 forKeyedSubscript:@"otherCount"];

  id v11 = +[NSNumber numberWithUnsignedLongLong:self->_uploadedSize];
  [v5 setObject:v11 forKeyedSubscript:@"uploadedSize"];
}

- (id)description
{
  if (self->_itemCount || self->_otherItemCount)
  {
    if (self->_uploadedSize || [(CPLCloudKitMetric *)self result])
    {
      id v3 = objc_alloc((Class)NSString);
      v4 = [(CPLCloudKitMetric *)self identifier];
      unint64_t itemCount = self->_itemCount;
      unint64_t otherItemCount = self->_otherItemCount;
      v7 = +[NSByteCountFormatter stringFromByteCount:self->_uploadSize countStyle:3];
      v8 = +[NSByteCountFormatter stringFromByteCount:self->_uploadedSize countStyle:3];
      v9 = [(CPLCloudKitMetric *)self resultDescription];
      id v10 = [v3 initWithFormat:@"<%@ (%lu/%lu/%@ -> %@)%@>", v4, itemCount, otherItemCount, v7, v8, v9];
    }
    else
    {
      id v12 = objc_alloc((Class)NSString);
      v13 = [(CPLCloudKitMetric *)self identifier];
      unint64_t v14 = self->_itemCount;
      unint64_t v15 = self->_otherItemCount;
      v16 = +[NSByteCountFormatter stringFromByteCount:self->_uploadSize countStyle:3];
      id v10 = [v12 initWithFormat:@"<%@ (%lu/%lu/%@)>", v13, v14, v15, v16];
    }
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)CPLCloudKitUploadMetric;
    id v10 = [(CPLCloudKitMetric *)&v17 description];
  }
  return v10;
}

- (unint64_t)itemCount
{
  return self->_itemCount;
}

- (void)setItemCount:(unint64_t)a3
{
  self->_unint64_t itemCount = a3;
}

- (unint64_t)uploadSize
{
  return self->_uploadSize;
}

- (void)setUploadSize:(unint64_t)a3
{
  self->_uploadSize = a3;
}

- (unint64_t)referencedResourcesCount
{
  return self->_referencedResourcesCount;
}

- (void)setReferencedResourcesCount:(unint64_t)a3
{
  self->_referencedResourcesCount = a3;
}

- (unint64_t)referencedResourcesSize
{
  return self->_referencedResourcesSize;
}

- (void)setReferencedResourcesSize:(unint64_t)a3
{
  self->_referencedResourcesSize = a3;
}

- (unint64_t)otherItemCount
{
  return self->_otherItemCount;
}

- (void)setOtherItemCount:(unint64_t)a3
{
  self->_unint64_t otherItemCount = a3;
}

- (unint64_t)uploadedSize
{
  return self->_uploadedSize;
}

- (void)setUploadedSize:(unint64_t)a3
{
  self->_uploadedSize = a3;
}

@end