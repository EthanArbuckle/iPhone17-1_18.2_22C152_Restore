@interface TouchAccuracyInputs
- (BOOL)connectedToPowerRequired;
- (BOOL)validateAndInitializeParameters:(id)a3;
- (NSArray)positions;
- (double)blockHeight;
- (double)blockWidth;
- (double)noInputTimeout;
- (double)partialInputTimeout;
- (int)numberOfBlocks;
- (void)setBlockHeight:(double)a3;
- (void)setBlockWidth:(double)a3;
- (void)setConnectedToPowerRequired:(BOOL)a3;
- (void)setNoInputTimeout:(double)a3;
- (void)setNumberOfBlocks:(int)a3;
- (void)setPartialInputTimeout:(double)a3;
- (void)setPositions:(id)a3;
@end

@implementation TouchAccuracyInputs

- (BOOL)validateAndInitializeParameters:(id)a3
{
  char v13 = 0;
  id v4 = a3;
  [self setConnectedToPowerRequired:[v4 dk_BOOLFromKey:@"connectedToPowerRequired" defaultValue:0 failed:&v13]];
  v5 = [v4 dk_numberFromKey:@"partialInputTimeout" lowerBound:&off_100008798 upperBound:&off_1000087A8 defaultValue:&off_1000087B8 failed:&v13];
  [v5 doubleValue];
  [(TouchAccuracyInputs *)self setPartialInputTimeout:"setPartialInputTimeout:"];

  v6 = [v4 dk_numberFromKey:@"noInputTimeout" lowerBound:&off_100008798 upperBound:&off_1000087A8 defaultValue:&off_1000087C8 failed:&v13];
  [v6 doubleValue];
  [(TouchAccuracyInputs *)self setNoInputTimeout:"setNoInputTimeout:"];

  v7 = [v4 dk_numberFromRequiredKey:@"blockWidth" lowerBound:&off_1000087D8 upperBound:&off_1000087E8 failed:&v13];
  [v7 doubleValue];
  -[TouchAccuracyInputs setBlockWidth:](self, "setBlockWidth:");

  v8 = [v4 dk_numberFromRequiredKey:@"blockHeight" lowerBound:&off_1000087D8 upperBound:&off_1000087E8 failed:&v13];
  [v8 doubleValue];
  -[TouchAccuracyInputs setBlockHeight:](self, "setBlockHeight:");

  v9 = +[NSSet setWithObject:objc_opt_class()];
  v10 = [v4 dk_arrayFromRequiredKey:@"positions" types:v9 maxLength:25000000 failed:&v13 validator:&stru_100008278];

  [(TouchAccuracyInputs *)self setPositions:v10];
  v11 = [(TouchAccuracyInputs *)self positions];
  -[TouchAccuracyInputs setNumberOfBlocks:](self, "setNumberOfBlocks:", [v11 count]);

  return v13 == 0;
}

- (double)blockWidth
{
  return self->_blockWidth;
}

- (void)setBlockWidth:(double)a3
{
  self->_blockWidth = a3;
}

- (double)blockHeight
{
  return self->_blockHeight;
}

- (void)setBlockHeight:(double)a3
{
  self->_blockHeight = a3;
}

- (NSArray)positions
{
  return self->_positions;
}

- (void)setPositions:(id)a3
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

- (double)partialInputTimeout
{
  return self->_partialInputTimeout;
}

- (void)setPartialInputTimeout:(double)a3
{
  self->_partialInputTimeout = a3;
}

- (BOOL)connectedToPowerRequired
{
  return self->_connectedToPowerRequired;
}

- (void)setConnectedToPowerRequired:(BOOL)a3
{
  self->_connectedToPowerRequired = a3;
}

- (int)numberOfBlocks
{
  return self->_numberOfBlocks;
}

- (void)setNumberOfBlocks:(int)a3
{
  self->_numberOfBlocks = a3;
}

- (void).cxx_destruct
{
}

@end