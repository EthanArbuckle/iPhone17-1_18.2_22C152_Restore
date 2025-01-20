@interface _AXTableViewCellInternal
- (_AXTableViewCellInternal)init;
@end

@implementation _AXTableViewCellInternal

- (_AXTableViewCellInternal)init
{
  SEL v11 = a2;
  v12 = 0;
  v10.receiver = self;
  v10.super_class = (Class)_AXTableViewCellInternal;
  v12 = [(_AXTableViewCellInternal *)&v10 init];
  objc_storeStrong((id *)&v12, v12);
  uint64_t v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF980]), "initWithCapacity:");
  children = v12->children;
  v12->children = (NSMutableArray *)v2;

  uint64_t v4 = [objc_allocWithZone(MEMORY[0x263EFF980]) initWithCapacity:0];
  mockSubviews = v12->mockSubviews;
  v12->mockSubviews = (NSMutableArray *)v4;

  uint64_t v6 = [objc_allocWithZone(MEMORY[0x263EFF9A0]) initWithCapacity:0];
  subClassData = v12->_subClassData;
  v12->_subClassData = (NSMutableDictionary *)v6;

  v9 = v12;
  objc_storeStrong((id *)&v12, 0);
  return v9;
}

- (void).cxx_destruct
{
}

@end