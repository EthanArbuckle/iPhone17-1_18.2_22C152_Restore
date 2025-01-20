@interface AXElementVision__generated__Output
- (AXElementVision__generated__Output)initWithConfidence:(id)a3 coordinates:(id)a4;
- (MLMultiArray)confidence;
- (MLMultiArray)coordinates;
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
- (void)setConfidence:(id)a3;
- (void)setCoordinates:(id)a3;
@end

@implementation AXElementVision__generated__Output

- (AXElementVision__generated__Output)initWithConfidence:(id)a3 coordinates:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (self)
  {
    objc_storeStrong((id *)&self->_confidence, a3);
    objc_storeStrong((id *)&self->_coordinates, a4);
  }

  return self;
}

- (NSSet)featureNames
{
  return (NSSet *)[MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F0E94158];
}

- (id)featureValueForName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"confidence"])
  {
    uint64_t v5 = 8;
LABEL_5:
    v6 = [MEMORY[0x1E4F1E950] featureValueWithMultiArray:*(Class *)((char *)&self->super.isa + v5)];
    goto LABEL_7;
  }
  if ([v4 isEqualToString:@"coordinates"])
  {
    uint64_t v5 = 16;
    goto LABEL_5;
  }
  v6 = 0;
LABEL_7:

  return v6;
}

- (MLMultiArray)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(id)a3
{
}

- (MLMultiArray)coordinates
{
  return self->_coordinates;
}

- (void)setCoordinates:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinates, 0);

  objc_storeStrong((id *)&self->_confidence, 0);
}

@end