@interface SGMultiHeadPredictionItem
- (NSNumber)score;
- (NSString)label;
- (SGMultiHeadPredictionItem)initWithScore:(id)a3 label:(id)a4;
@end

@implementation SGMultiHeadPredictionItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_score, 0);
}

- (NSString)label
{
  return self->_label;
}

- (NSNumber)score
{
  return self->_score;
}

- (SGMultiHeadPredictionItem)initWithScore:(id)a3 label:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"SGMultiHeadInference.m", 35, @"Invalid parameter not satisfying: %@", @"score" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)SGMultiHeadPredictionItem;
  v10 = [(SGMultiHeadPredictionItem *)&v14 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_score, a3);
    objc_storeStrong((id *)&v11->_label, a4);
  }

  return v11;
}

@end