@interface MTLTag
- (MTLTag)initWithTagType:(unint64_t)a3;
- (id)formattedDescription:(unint64_t)a3;
- (unint64_t)tagType;
@end

@implementation MTLTag

- (MTLTag)initWithTagType:(unint64_t)a3
{
  self->_tagType = a3;
  return self;
}

- (id)formattedDescription:(unint64_t)a3
{
  v9[3] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [@"\n" stringByPaddingToLength:a3 + 4 withString:@" " startingAtIndex:0];
  v5 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MTLTag;
  id v6 = [(MTLTag *)&v8 description];
  v9[0] = v4;
  v9[1] = @"Tag =";
  v9[2] = MTLTagTypeString(self->_tagType);
  return (id)[v5 stringWithFormat:@"%@%@", v6, objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v9, 3), "componentsJoinedByString:", @" "];
}

- (unint64_t)tagType
{
  return self->_tagType;
}

@end