@interface _CSVisualizerTableFunctions
- (id)copyWithZone:(_NSZone *)a3;
- (id)getDescription;
- (id)getSummary;
- (void)setGetDescription:(id)a3;
- (void)setGetSummary:(id)a3;
@end

@implementation _CSVisualizerTableFunctions

- (void).cxx_destruct
{
  objc_storeStrong(&self->_getDescription, 0);

  objc_storeStrong(&self->_getSummary, 0);
}

- (void)setGetDescription:(id)a3
{
}

- (id)getDescription
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setGetSummary:(id)a3
{
}

- (id)getSummary
{
  return objc_getProperty(self, a2, 8, 1);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    uint64_t v5 = MEMORY[0x1AD0DB340](self->_getSummary);
    v6 = (void *)v4[1];
    v4[1] = v5;

    uint64_t v7 = MEMORY[0x1AD0DB340](self->_getDescription);
    v8 = (void *)v4[2];
    v4[2] = v7;
  }
  return v4;
}

@end