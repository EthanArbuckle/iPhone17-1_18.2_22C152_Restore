@interface MTRContentLauncherClusterDimensionStruct
- (MTRContentLauncherClusterDimensionStruct)init;
- (NSNumber)height;
- (NSNumber)metric;
- (NSNumber)width;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setHeight:(NSNumber *)height;
- (void)setMetric:(NSNumber *)metric;
- (void)setWidth:(NSNumber *)width;
@end

@implementation MTRContentLauncherClusterDimensionStruct

- (MTRContentLauncherClusterDimensionStruct)init
{
  v8.receiver = self;
  v8.super_class = (Class)MTRContentLauncherClusterDimensionStruct;
  v2 = [(MTRContentLauncherClusterDimensionStruct *)&v8 init];
  v3 = v2;
  if (v2)
  {
    width = v2->_width;
    v2->_width = (NSNumber *)&unk_26F9C8620;

    height = v3->_height;
    v3->_height = (NSNumber *)&unk_26F9C8620;

    metric = v3->_metric;
    v3->_metric = (NSNumber *)&unk_26F9C8620;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRContentLauncherClusterDimensionStruct);
  v7 = objc_msgSend_width(self, v5, v6);
  objc_msgSend_setWidth_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_height(self, v9, v10);
  objc_msgSend_setHeight_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_metric(self, v13, v14);
  objc_msgSend_setMetric_(v4, v16, (uint64_t)v15);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: width:%@; height:%@; metric:%@; >",
    v5,
    self->_width,
    self->_height,
  v7 = self->_metric);

  return v7;
}

- (NSNumber)width
{
  return self->_width;
}

- (void)setWidth:(NSNumber *)width
{
}

- (NSNumber)height
{
  return self->_height;
}

- (void)setHeight:(NSNumber *)height
{
}

- (NSNumber)metric
{
  return self->_metric;
}

- (void)setMetric:(NSNumber *)metric
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metric, 0);
  objc_storeStrong((id *)&self->_height, 0);

  objc_storeStrong((id *)&self->_width, 0);
}

@end