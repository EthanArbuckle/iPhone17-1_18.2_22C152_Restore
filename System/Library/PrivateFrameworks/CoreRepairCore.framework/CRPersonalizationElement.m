@interface CRPersonalizationElement
- (CRPersonalizationElement)init;
- (CRPersonalizationElement)initWithID:(id)a3 param:(id)a4 requestFunction:(id)a5 responseFunction:(id)a6;
- (NSString)elementId;
- (id)data;
- (id)param;
- (id)personalizationMeasurementCreator;
- (id)personalizationResponseParser;
- (void)setData:(id)a3;
- (void)setElementId:(id)a3;
- (void)setParam:(id)a3;
- (void)setPersonalizationMeasurementCreator:(id)a3;
- (void)setPersonalizationResponseParser:(id)a3;
@end

@implementation CRPersonalizationElement

- (CRPersonalizationElement)initWithID:(id)a3 param:(id)a4 requestFunction:(id)a5 responseFunction:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v23.receiver = self;
  v23.super_class = (Class)CRPersonalizationElement;
  v15 = [(CRPersonalizationElement *)&v23 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_elementId, a3);
    objc_storeStrong(&v16->_param, a4);
    uint64_t v17 = MEMORY[0x223C5C490](v13);
    id personalizationMeasurementCreator = v16->_personalizationMeasurementCreator;
    v16->_id personalizationMeasurementCreator = (id)v17;

    uint64_t v19 = MEMORY[0x223C5C490](v14);
    id personalizationResponseParser = v16->_personalizationResponseParser;
    v16->_id personalizationResponseParser = (id)v19;

    id data = v16->_data;
    v16->_id data = 0;
  }
  return v16;
}

- (CRPersonalizationElement)init
{
  return 0;
}

- (NSString)elementId
{
  return self->_elementId;
}

- (void)setElementId:(id)a3
{
}

- (id)param
{
  return self->_param;
}

- (void)setParam:(id)a3
{
}

- (id)personalizationMeasurementCreator
{
  return self->_personalizationMeasurementCreator;
}

- (void)setPersonalizationMeasurementCreator:(id)a3
{
}

- (id)personalizationResponseParser
{
  return self->_personalizationResponseParser;
}

- (void)setPersonalizationResponseParser:(id)a3
{
}

- (id)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_data, 0);
  objc_storeStrong(&self->_personalizationResponseParser, 0);
  objc_storeStrong(&self->_personalizationMeasurementCreator, 0);
  objc_storeStrong(&self->_param, 0);
  objc_storeStrong((id *)&self->_elementId, 0);
}

@end