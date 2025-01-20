@interface IKCSSSelector
- (NSString)name;
- (NSString)stringValue;
- (_NSRange)range;
- (id)description;
- (int64_t)type;
- (void)setName:(id)a3;
- (void)setRange:(_NSRange)a3;
- (void)setType:(int64_t)a3;
@end

@implementation IKCSSSelector

- (void)setName:(id)a3
{
  objc_msgSend(a3, "ik_sharedInstance");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  name = self->_name;
  self->_name = v4;
  MEMORY[0x1F41817F8](v4, name);
}

- (NSString)stringValue
{
  switch([(IKCSSSelector *)self type])
  {
    case 0:
      v3 = NSString;
      v4 = [(IKCSSSelector *)self name];
      [v3 stringWithFormat:@".%@", v4];
      goto LABEL_6;
    case 1:
      v6 = NSString;
      v4 = [(IKCSSSelector *)self name];
      [v6 stringWithFormat:@"#%@", v4];
      goto LABEL_6;
    case 2:
      v7 = NSString;
      v4 = [(IKCSSSelector *)self name];
      [v7 stringWithFormat:@"%@", v4];
LABEL_6:
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

      break;
    case 3:
      v5 = [NSString stringWithFormat:@"*"];
      break;
    default:
      v5 = @"\"UNHANDLED_SELECTOR_TYPE\"";
      break;
  }
  return (NSString *)v5;
}

- (id)description
{
  switch([(IKCSSSelector *)self type])
  {
    case 0:
      v3 = NSString;
      v4 = [(IKCSSSelector *)self name];
      v5 = [(IKCSSSelector *)self name];
      [v3 stringWithFormat:@"{type:\"class\", name:\"%@\", value:\".%@\"}", v4, v5];
      goto LABEL_6;
    case 1:
      v7 = NSString;
      v4 = [(IKCSSSelector *)self name];
      v5 = [(IKCSSSelector *)self name];
      [v7 stringWithFormat:@"{type:\"id\", name:\"%@\", value:\"#%@\"}", v4, v5];
      goto LABEL_6;
    case 2:
      v8 = NSString;
      v4 = [(IKCSSSelector *)self name];
      v5 = [(IKCSSSelector *)self name];
      [v8 stringWithFormat:@"{type:\"type\", name:\"%@\", value:\"%@\"}", v4, v5];
LABEL_6:
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

      break;
    case 3:
      v6 = [NSString stringWithFormat:@"{type:\"universal\", value:\"*\"}"];
      break;
    default:
      v6 = @"\"UNHANDLED_SELECTOR_TYPE\"";
      break;
  }
  return v6;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSString)name
{
  return self->_name;
}

- (_NSRange)range
{
  NSUInteger length = self->_range.length;
  NSUInteger location = self->_range.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
}

- (void).cxx_destruct
{
}

@end