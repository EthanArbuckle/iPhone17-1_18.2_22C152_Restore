@interface CHTextFieldTypeSwitchStep
- (CHPostProcessingManager)defaultProcessor;
- (id)initProcessorDefault:(id)a3 processorDigits:(id)a4 processorPhone:(id)a5 processorUsername:(id)a6 processorEmail:(id)a7 processorURL:(id)a8 processorASCII:(id)a9 processorEquation:(id)a10;
- (id)process:(id)a3 options:(id)a4;
- (void)setDefaultProcessor:(id)a3;
@end

@implementation CHTextFieldTypeSwitchStep

- (id)initProcessorDefault:(id)a3 processorDigits:(id)a4 processorPhone:(id)a5 processorUsername:(id)a6 processorEmail:(id)a7 processorURL:(id)a8 processorASCII:(id)a9 processorEquation:(id)a10
{
  id v17 = a3;
  id v27 = a4;
  id v26 = a5;
  id v25 = a6;
  id v24 = a7;
  id v23 = a8;
  id v22 = a9;
  id v21 = a10;
  v28.receiver = self;
  v28.super_class = (Class)CHTextFieldTypeSwitchStep;
  v18 = [(CHTextFieldTypeSwitchStep *)&v28 init];
  p_isa = (id *)&v18->super.super.super.isa;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_defaultProcessor, a3);
    objc_storeStrong(p_isa + 1, a4);
    objc_storeStrong(p_isa + 2, a5);
    objc_storeStrong(p_isa + 3, a6);
    objc_storeStrong(p_isa + 4, a7);
    objc_storeStrong(p_isa + 5, a8);
    objc_storeStrong(p_isa + 6, a9);
    objc_storeStrong(p_isa + 7, a10);
  }

  return p_isa;
}

- (id)process:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  switch(objc_msgSend_contentType(v6, v8, v9, v10, v11, v12))
  {
    case 0u:
      v18 = objc_msgSend_defaultProcessor(self, v13, v14, v15, v16, v17);
      sub_1C4C04EBC(self, v6, v18, v7);
      self = (CHTextFieldTypeSwitchStep *)objc_claimAutoreleasedReturnValue();

      break;
    case 1u:
      if (self) {
        digitProcessor = self->_digitProcessor;
      }
      else {
        digitProcessor = 0;
      }
      goto LABEL_17;
    case 2u:
      if (self) {
        digitProcessor = self->_phoneProcessor;
      }
      else {
        digitProcessor = 0;
      }
      goto LABEL_17;
    case 3u:
      if (self) {
        digitProcessor = self->_usernameProcessor;
      }
      else {
        digitProcessor = 0;
      }
      goto LABEL_17;
    case 4u:
      if (self) {
        digitProcessor = self->_emailProcessor;
      }
      else {
        digitProcessor = 0;
      }
      goto LABEL_17;
    case 5u:
      if (self) {
        digitProcessor = self->_urlProcessor;
      }
      else {
        digitProcessor = 0;
      }
      goto LABEL_17;
    case 6u:
      if (self) {
        digitProcessor = self->_asciiProcessor;
      }
      else {
        digitProcessor = 0;
      }
      goto LABEL_17;
    case 7u:
      if (self) {
        digitProcessor = self->_equationProcessor;
      }
      else {
        digitProcessor = 0;
      }
LABEL_17:
      sub_1C4C04EBC(self, v6, digitProcessor, v7);
      self = (CHTextFieldTypeSwitchStep *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      break;
  }

  return self;
}

- (CHPostProcessingManager)defaultProcessor
{
  return self->_defaultProcessor;
}

- (void)setDefaultProcessor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultProcessor, 0);
  objc_storeStrong((id *)&self->_equationProcessor, 0);
  objc_storeStrong((id *)&self->_asciiProcessor, 0);
  objc_storeStrong((id *)&self->_urlProcessor, 0);
  objc_storeStrong((id *)&self->_emailProcessor, 0);
  objc_storeStrong((id *)&self->_usernameProcessor, 0);
  objc_storeStrong((id *)&self->_phoneProcessor, 0);
  objc_storeStrong((id *)&self->_digitProcessor, 0);
}

@end