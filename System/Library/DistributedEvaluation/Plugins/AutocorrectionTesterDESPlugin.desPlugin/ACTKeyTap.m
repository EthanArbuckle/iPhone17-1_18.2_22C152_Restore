@interface ACTKeyTap
- (ACTKeyTap)initWithIntendedKey:(id)a3 touchedKey:(id)a4 error:(id)a5 location:(CGPoint)a6 timestamp:(double)a7 secondaryString:(BOOL)a8;
- (BOOL)secondaryString;
- (CGPoint)location;
- (TIPointError)error;
- (UIKBTree)intendedKey;
- (UIKBTree)touchedKey;
- (double)timestamp;
- (id)abbreviatedDescription;
- (id)description;
- (id)shortDescription;
- (void)applyWithTyper:(id)a3 log:(id)a4;
@end

@implementation ACTKeyTap

- (ACTKeyTap)initWithIntendedKey:(id)a3 touchedKey:(id)a4 error:(id)a5 location:(CGPoint)a6 timestamp:(double)a7 secondaryString:(BOOL)a8
{
  CGFloat y = a6.y;
  CGFloat x = a6.x;
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  v22.receiver = self;
  v22.super_class = (Class)ACTKeyTap;
  v19 = [(ACTKeyTap *)&v22 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_intendedKey, a3);
    objc_storeStrong((id *)&v20->_touchedKey, a4);
    objc_storeStrong((id *)&v20->_error, a5);
    v20->_location.CGFloat x = x;
    v20->_location.CGFloat y = y;
    v20->_timestamp = a7;
    v20->_secondaryString = a8;
  }

  return v20;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [(ACTKeyTap *)self intendedKey];
  v6 = [v5 representedString];
  v7 = [(ACTKeyTap *)self touchedKey];
  v8 = [v7 representedString];
  v9 = [(ACTKeyTap *)self error];
  [(ACTKeyTap *)self location];
  uint64_t v11 = v10;
  [(ACTKeyTap *)self location];
  uint64_t v13 = v12;
  [(ACTKeyTap *)self timestamp];
  v15 = +[NSString stringWithFormat:@"<%@: intended=%@, touched=%@, error=%@, loc=(%.0f,%.0f), t=%.2f>", v4, v6, v8, v9, v11, v13, v14];

  return v15;
}

- (void)applyWithTyper:(id)a3 log:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  [(ACTKeyTap *)self location];
  double v8 = v7;
  double v10 = v9;
  [(ACTKeyTap *)self timestamp];
  double v12 = v11;
  uint64_t v13 = [(ACTKeyTap *)self intendedKey];
  uint64_t v14 = [(ACTKeyTap *)self touchedKey];
  BOOL v15 = [(ACTKeyTap *)self secondaryString];
  id v16 = [(ACTKeyTap *)self error];
  id v17 = objc_msgSend(v18, "_performTapAtLocation:timestamp:intendedKey:touchedKey:secondaryString:touchError:typingLog:", v13, v14, v15, v16, v6, v8, v10, v12);
}

- (id)shortDescription
{
  v3 = [(ACTKeyTap *)self intendedKey];
  v4 = [v3 displayString];
  v5 = [v4 stringByPaddingToLength:7 withString:@" " startingAtIndex:0];
  id v6 = [(ACTKeyTap *)self touchedKey];
  double v7 = [v6 displayString];
  double v8 = [v7 stringByPaddingToLength:7 withString:@" " startingAtIndex:0];
  double v9 = +[NSString stringWithFormat:@"KeyTap intended/touched: %@ %@", v5, v8];

  return v9;
}

- (id)abbreviatedDescription
{
  v3 = [(ACTKeyTap *)self intendedKey];
  v4 = [v3 representedString];
  v5 = [(ACTKeyTap *)self touchedKey];
  id v6 = [v5 representedString];
  double v7 = +[NSString stringWithFormat:@"%@ %@", v4, v6];

  return v7;
}

- (UIKBTree)intendedKey
{
  return self->_intendedKey;
}

- (UIKBTree)touchedKey
{
  return self->_touchedKey;
}

- (TIPointError)error
{
  return self->_error;
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

- (BOOL)secondaryString
{
  return self->_secondaryString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_touchedKey, 0);

  objc_storeStrong((id *)&self->_intendedKey, 0);
}

@end