@interface CAMQRCodeInstructionLabel
+ (BOOL)shouldDisplayInstructionForMRCResults:(id)a3 devicePosition:(int64_t)a4;
+ (id)_textForMRCResults:(id)a3 devicePosition:(int64_t)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)mrcResults;
- (int64_t)devicePosition;
- (void)_updateTextWithPriorMRCResults:(id)a3;
- (void)setDevicePosition:(int64_t)a3;
- (void)setMRCResults:(id)a3;
@end

@implementation CAMQRCodeInstructionLabel

+ (BOOL)shouldDisplayInstructionForMRCResults:(id)a3 devicePosition:(int64_t)a4
{
  v4 = [a1 _textForMRCResults:a3 devicePosition:a4];
  BOOL v5 = [v4 length] != 0;

  return v5;
}

+ (id)_textForMRCResults:(id)a3 devicePosition:(int64_t)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = v5;
  if (a4 == 1)
  {
LABEL_13:
    v7 = 0;
  }
  else
  {
    v7 = (void *)[v5 count];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          if (objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "isOfSignificantSize", (void)v14))
          {

            goto LABEL_13;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    if (v7)
    {
      v7 = CAMLocalizedFrameworkString(@"QR_CODE_MOVE_CLOSER", &stru_26BD78BA0);
    }
  }

  return v7;
}

- (void)setDevicePosition:(int64_t)a3
{
  if (self->_devicePosition != a3)
  {
    self->_devicePosition = a3;
    [(CAMQRCodeInstructionLabel *)self _updateTextWithPriorMRCResults:self->_mrcResults];
  }
}

- (void)setMRCResults:(id)a3
{
  v4 = (NSArray *)a3;
  mrcResults = self->_mrcResults;
  if (mrcResults != v4)
  {
    uint64_t v9 = v4;
    v6 = v4;
    v7 = self->_mrcResults;
    self->_mrcResults = v6;
    id v8 = mrcResults;

    [(CAMQRCodeInstructionLabel *)self _updateTextWithPriorMRCResults:v8];
    v4 = v9;
  }
}

- (void)_updateTextWithPriorMRCResults:(id)a3
{
  id v4 = a3;
  id v8 = [(CAMQRCodeInstructionLabel *)self mrcResults];
  id v5 = objc_msgSend((id)objc_opt_class(), "_textForMRCResults:devicePosition:", v8, -[CAMQRCodeInstructionLabel devicePosition](self, "devicePosition"));
  v6 = objc_msgSend((id)objc_opt_class(), "_textForMRCResults:devicePosition:", v4, -[CAMQRCodeInstructionLabel devicePosition](self, "devicePosition"));

  if (v5) {
    [(CAMInstructionLabel *)self setText:v5];
  }
  if (([v5 isEqualToString:v6] & 1) == 0)
  {
    v7 = [(CAMInstructionLabel *)self delegate];
    [v7 instructionLabelDidChangeIntrinsicContentSize:self];
  }
}

- (NSArray)mrcResults
{
  return self->_mrcResults;
}

- (int64_t)devicePosition
{
  return self->_devicePosition;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)CAMQRCodeInstructionLabel;
  -[CAMInstructionLabel sizeThatFits:](&v9, sel_sizeThatFits_);
  if (v5 < 108.0 && height == 0.0 && width == 0.0) {
    double v5 = 108.0;
  }
  result.double height = v6;
  result.double width = v5;
  return result;
}

- (void).cxx_destruct
{
}

@end