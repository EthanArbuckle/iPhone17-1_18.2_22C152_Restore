@interface ASDGatherLogsRequestOptions
- (BOOL)verbose;
- (NSArray)urlFilters;
- (NSString)fileName;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setFileName:(id)a3;
- (void)setUrlFilters:(id)a3;
- (void)setVerbose:(BOOL)a3;
@end

@implementation ASDGatherLogsRequestOptions

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[ASDGatherLogsRequestOptions allocWithZone:a3] init];
  uint64_t v5 = [(NSString *)self->_fileName copy];
  fileName = v4->_fileName;
  v4->_fileName = (NSString *)v5;

  v4->_verbose = self->_verbose;
  uint64_t v7 = [(NSArray *)self->_urlFilters copy];
  urlFilters = v4->_urlFilters;
  v4->_urlFilters = (NSArray *)v7;

  return v4;
}

- (NSString)fileName
{
  return self->_fileName;
}

- (void)setFileName:(id)a3
{
}

- (BOOL)verbose
{
  return self->_verbose;
}

- (void)setVerbose:(BOOL)a3
{
  self->_verbose = a3;
}

- (NSArray)urlFilters
{
  return self->_urlFilters;
}

- (void)setUrlFilters:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlFilters, 0);
  objc_storeStrong((id *)&self->_fileName, 0);
}

@end