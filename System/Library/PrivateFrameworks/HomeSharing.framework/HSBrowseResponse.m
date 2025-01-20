@interface HSBrowseResponse
- (NSArray)collections;
- (void)dealloc;
- (void)setCollections:(id)a3;
@end

@implementation HSBrowseResponse

- (void).cxx_destruct
{
}

- (void)setCollections:(id)a3
{
}

- (NSArray)collections
{
  return self->collections;
}

- (void)dealloc
{
  [(HSBrowseResponse *)self setCollections:0];
  v3.receiver = self;
  v3.super_class = (Class)HSBrowseResponse;
  [(HSBrowseResponse *)&v3 dealloc];
}

@end