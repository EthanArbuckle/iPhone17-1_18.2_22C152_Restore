@interface TouchResponseInputs
- (BOOL)connectedToPowerRequired;
- (BOOL)validateAndInitializeParameters:(id)a3;
- (NSArray)touchMap;
- (NSDictionary)touchMapDictionary;
- (UIColor)blockColor;
- (double)noInputTimeout;
- (double)timeoutSeconds;
- (void)setBlockColor:(id)a3;
- (void)setConnectedToPowerRequired:(BOOL)a3;
- (void)setNoInputTimeout:(double)a3;
- (void)setTimeoutSeconds:(double)a3;
- (void)setTouchMap:(id)a3;
- (void)setTouchMapDictionary:(id)a3;
@end

@implementation TouchResponseInputs

- (BOOL)validateAndInitializeParameters:(id)a3
{
  id v4 = a3;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  v27[0] = 0;
  [self setConnectedToPowerRequired:[v4 dk_BOOLFromKey:@"connectedToPowerRequired" defaultValue:0 failed:v27]];
  v5 = [v4 dk_numberFromKey:@"noInputTimeout" lowerBound:&off_1000086F8 upperBound:&off_100008708 defaultValue:&off_100008718 failed:v25 + 3];
  [v5 doubleValue];
  [(TouchResponseInputs *)self setNoInputTimeout:"setNoInputTimeout:"];

  v6 = [v4 dk_numberFromRequiredKey:@"timeoutSeconds" lowerBound:&off_1000086F8 upperBound:&off_100008708 failed:v25 + 3];
  [v6 doubleValue];
  [(TouchResponseInputs *)self setTimeoutSeconds:"setTimeoutSeconds:"];

  v7 = [v4 dk_stringFromRequiredKey:@"blockColor" maxLength:7 failed:v25 + 3];
  v8 = +[UIColor colorWithHexValue:v7 error:0];
  [(TouchResponseInputs *)self setBlockColor:v8];

  v9 = [(TouchResponseInputs *)self blockColor];

  v10 = v25;
  if (!v9) {
    *((unsigned char *)v25 + 24) = 1;
  }
  v11 = [v4 dk_dictionaryFromRequiredKey:@"touchMap" failed:v10 + 3];
  [(TouchResponseInputs *)self setTouchMapDictionary:v11];

  v12 = [(TouchResponseInputs *)self touchMapDictionary];
  v13 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v12 count]);

  v14 = [(TouchResponseInputs *)self touchMapDictionary];
  v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472;
  v20 = sub_1000057C4;
  v21 = &unk_1000082D0;
  v23 = &v24;
  id v15 = v13;
  id v22 = v15;
  [v14 enumerateKeysAndObjectsUsingBlock:&v18];

  -[TouchResponseInputs setTouchMap:](self, "setTouchMap:", v15, v18, v19, v20, v21);
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

- (UIColor)blockColor
{
  return self->_blockColor;
}

- (void)setBlockColor:(id)a3
{
}

- (double)noInputTimeout
{
  return self->_noInputTimeout;
}

- (void)setNoInputTimeout:(double)a3
{
  self->_noInputTimeout = a3;
}

- (double)timeoutSeconds
{
  return self->_timeoutSeconds;
}

- (void)setTimeoutSeconds:(double)a3
{
  self->_timeoutSeconds = a3;
}

- (BOOL)connectedToPowerRequired
{
  return self->_connectedToPowerRequired;
}

- (void)setConnectedToPowerRequired:(BOOL)a3
{
  self->_connectedToPowerRequired = a3;
}

- (NSDictionary)touchMapDictionary
{
  return self->_touchMapDictionary;
}

- (void)setTouchMapDictionary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchMapDictionary, 0);
  objc_storeStrong((id *)&self->_blockColor, 0);

  objc_storeStrong((id *)&self->_touchMap, 0);
}

@end