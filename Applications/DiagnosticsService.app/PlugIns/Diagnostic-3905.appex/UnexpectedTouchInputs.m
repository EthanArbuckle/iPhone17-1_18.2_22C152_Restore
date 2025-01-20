@interface UnexpectedTouchInputs
- (BOOL)connectedToPowerRequired;
- (BOOL)validateAndInitializeParameters:(id)a3;
- (NSArray)touchMap;
- (UIColor)fadeColor;
- (UIColor)touchColor;
- (int)minutesToRun;
- (void)setConnectedToPowerRequired:(BOOL)a3;
- (void)setFadeColor:(id)a3;
- (void)setMinutesToRun:(int)a3;
- (void)setTouchColor:(id)a3;
- (void)setTouchMap:(id)a3;
@end

@implementation UnexpectedTouchInputs

- (BOOL)validateAndInitializeParameters:(id)a3
{
  id v4 = a3;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  v27[0] = 0;
  -[UnexpectedTouchInputs setConnectedToPowerRequired:[v4 dk_BOOLFromKey:@"connectedToPowerRequired" defaultValue:0 failed:v27]];
  v5 = [v4 dk_stringFromRequiredKey:@"fadeColor" maxLength:7 failed:v25 + 3];
  v6 = +[UIColor colorWithHexValue:v5 error:0];
  [(UnexpectedTouchInputs *)self setFadeColor:v6];

  v7 = [(UnexpectedTouchInputs *)self fadeColor];

  v8 = v25;
  if (!v7) {
    *((unsigned char *)v25 + 24) = 1;
  }
  v9 = [v4 dk_stringFromRequiredKey:@"touchColor" maxLength:7 failed:v8 + 3];
  v10 = +[UIColor colorWithHexValue:v9 error:0];
  [(UnexpectedTouchInputs *)self setTouchColor:v10];

  v11 = [(UnexpectedTouchInputs *)self touchColor];

  v12 = v25;
  if (!v11) {
    *((unsigned char *)v25 + 24) = 1;
  }
  v13 = [v4 dk_numberFromRequiredKey:@"minutesToRun" lowerBound:&off_100008778 upperBound:&off_100008790 failed:v12 + 3];
  -[UnexpectedTouchInputs setMinutesToRun:](self, "setMinutesToRun:", [v13 intValue]);

  v14 = [v4 dk_dictionaryFromRequiredKey:@"touchMap" failed:v25 + 3];
  +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v14 count]);
  v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472;
  v20 = sub_100001FE8;
  v21 = &unk_100008270;
  v23 = &v24;
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  id v22 = v15;
  [v14 enumerateKeysAndObjectsUsingBlock:&v18];
  -[UnexpectedTouchInputs setTouchMap:](self, "setTouchMap:", v15, v18, v19, v20, v21);
  BOOL v16 = *((unsigned char *)v25 + 24) == 0;

  _Block_object_dispose(&v24, 8);
  return v16;
}

- (NSArray)touchMap
{
  return self->_touchMap;
}

- (void)setTouchMap:(id)a3
{
}

- (UIColor)fadeColor
{
  return self->_fadeColor;
}

- (void)setFadeColor:(id)a3
{
}

- (UIColor)touchColor
{
  return self->_touchColor;
}

- (void)setTouchColor:(id)a3
{
}

- (int)minutesToRun
{
  return self->_minutesToRun;
}

- (void)setMinutesToRun:(int)a3
{
  self->_minutesToRun = a3;
}

- (BOOL)connectedToPowerRequired
{
  return self->_connectedToPowerRequired;
}

- (void)setConnectedToPowerRequired:(BOOL)a3
{
  self->_connectedToPowerRequired = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchColor, 0);
  objc_storeStrong((id *)&self->_fadeColor, 0);

  objc_storeStrong((id *)&self->_touchMap, 0);
}

@end