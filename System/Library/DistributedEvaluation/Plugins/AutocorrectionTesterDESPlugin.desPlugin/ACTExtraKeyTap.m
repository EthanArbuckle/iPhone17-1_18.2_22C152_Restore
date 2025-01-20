@interface ACTExtraKeyTap
- (ACTExtraKeyTap)initWithTouchedKey:(id)a3 location:(CGPoint)a4 timestamp:(double)a5;
- (CGPoint)location;
- (UIKBTree)touchedKey;
- (double)timestamp;
- (id)description;
- (id)shortDescription;
- (void)applyWithTyper:(id)a3 log:(id)a4;
@end

@implementation ACTExtraKeyTap

- (ACTExtraKeyTap)initWithTouchedKey:(id)a3 location:(CGPoint)a4 timestamp:(double)a5
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  id v10 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ACTExtraKeyTap;
  v11 = [(ACTExtraKeyTap *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_touchedKey, a3);
    v12->_location.CGFloat x = x;
    v12->_location.CGFloat y = y;
    v12->_timestamp = a5;
  }

  return v12;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [(ACTExtraKeyTap *)self touchedKey];
  v6 = [v5 representedString];
  [(ACTExtraKeyTap *)self location];
  uint64_t v8 = v7;
  [(ACTExtraKeyTap *)self location];
  uint64_t v10 = v9;
  [(ACTExtraKeyTap *)self timestamp];
  v12 = +[NSString stringWithFormat:@"<%@: touchedKey=%@, loc=(%.0f,%.0f), t=%.2f>", v4, v6, v8, v10, v11];

  return v12;
}

- (void)applyWithTyper:(id)a3 log:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  [(ACTExtraKeyTap *)self location];
  double v8 = v7;
  double v10 = v9;
  [(ACTExtraKeyTap *)self timestamp];
  double v12 = v11;
  v13 = [(ACTExtraKeyTap *)self touchedKey];
  id v14 = objc_msgSend(v15, "_performTapAtLocation:timestamp:intendedKey:touchedKey:secondaryString:touchError:typingLog:", 0, v13, 0, 0, v6, v8, v10, v12);
}

- (id)shortDescription
{
  v2 = [(ACTExtraKeyTap *)self touchedKey];
  v3 = [v2 displayString];
  v4 = +[NSString stringWithFormat:@"ExtraKey touched: %@", v3];

  return v4;
}

- (UIKBTree)touchedKey
{
  return self->_touchedKey;
}

- (CGPoint)location
{
  double x = self->_location.x;
  double y = self->_location.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void).cxx_destruct
{
}

@end