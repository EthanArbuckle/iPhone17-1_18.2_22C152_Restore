@interface _NNLayerInfo
- (BOOL)bidirectional;
- (NSString)concatenatedInputNames;
- (NSString)type;
- (_NNLayerInfo)initWithType:(id)a3 concatenatedInputNames:(id)a4 bidirectional:(BOOL)a5;
@end

@implementation _NNLayerInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_concatenatedInputNames, 0);

  objc_storeStrong((id *)&self->_type, 0);
}

- (_NNLayerInfo)initWithType:(id)a3 concatenatedInputNames:(id)a4 bidirectional:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_NNLayerInfo;
  v11 = [(_NNLayerInfo *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_type, a3);
    objc_storeStrong((id *)&v12->_concatenatedInputNames, a4);
    v12->_bidirectional = a5;
  }

  return v12;
}

- (NSString)concatenatedInputNames
{
  return self->_concatenatedInputNames;
}

- (NSString)type
{
  return self->_type;
}

- (BOOL)bidirectional
{
  return self->_bidirectional;
}

@end