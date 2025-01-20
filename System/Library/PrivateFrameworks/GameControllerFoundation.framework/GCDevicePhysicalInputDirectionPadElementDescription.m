@interface GCDevicePhysicalInputDirectionPadElementDescription
+ (BOOL)supportsSecureCoding;
- (BOOL)isAnalog;
- (BOOL)isEqual:(id)a3;
- (GCDevicePhysicalInputDirectionPadElementDescription)init;
- (GCDevicePhysicalInputDirectionPadElementDescription)initWithCoder:(id)a3;
- (NSArray)downSources;
- (NSArray)leftSources;
- (NSArray)rightSources;
- (NSArray)upSources;
- (NSArray)xSources;
- (NSArray)xySources;
- (NSArray)ySources;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)eventDownValueField;
- (unint64_t)eventLeftValueField;
- (unint64_t)eventRightValueField;
- (unint64_t)eventUpValueField;
- (void)encodeWithCoder:(id)a3;
- (void)setAnalog:(BOOL)a3;
- (void)setDownSources:(id)a3;
- (void)setEventDownValueField:(unint64_t)a3;
- (void)setEventLeftValueField:(unint64_t)a3;
- (void)setEventRightValueField:(unint64_t)a3;
- (void)setEventUpValueField:(unint64_t)a3;
- (void)setLeftSources:(id)a3;
- (void)setRightSources:(id)a3;
- (void)setUpSources:(id)a3;
- (void)setXSources:(id)a3;
- (void)setXySources:(id)a3;
- (void)setYSources:(id)a3;
@end

@implementation GCDevicePhysicalInputDirectionPadElementDescription

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCDevicePhysicalInputDirectionPadElementDescription)init
{
  v3.receiver = self;
  v3.super_class = (Class)GCDevicePhysicalInputDirectionPadElementDescription;
  result = [(GCDevicePhysicalInputElementDescription *)&v3 init];
  result->_eventUpValueField = -1;
  result->_eventDownValueField = -1;
  result->_eventLeftValueField = -1;
  result->_eventRightValueField = -1;
  return result;
}

- (GCDevicePhysicalInputDirectionPadElementDescription)initWithCoder:(id)a3
{
  v35.receiver = self;
  v35.super_class = (Class)GCDevicePhysicalInputDirectionPadElementDescription;
  id v3 = a3;
  v4 = [(GCDevicePhysicalInputElementDescription *)&v35 initWithCoder:v3];
  uint64_t v5 = objc_opt_class();
  v6 = +[NSSet setWithObjects:](&off_26BEEB310, "setWithObjects:", v5, objc_opt_class(), 0, v35.receiver, v35.super_class);
  uint64_t v7 = [v3 decodeObjectOfClasses:v6 forKey:@"xySources"];
  xySources = v4->_xySources;
  v4->_xySources = (NSArray *)v7;

  uint64_t v9 = objc_opt_class();
  v10 = +[NSSet setWithObjects:](&off_26BEEB310, "setWithObjects:", v9, objc_opt_class(), 0);
  uint64_t v11 = [v3 decodeObjectOfClasses:v10 forKey:@"xSources"];
  xSources = v4->_xSources;
  v4->_xSources = (NSArray *)v11;

  uint64_t v13 = objc_opt_class();
  v14 = +[NSSet setWithObjects:](&off_26BEEB310, "setWithObjects:", v13, objc_opt_class(), 0);
  uint64_t v15 = [v3 decodeObjectOfClasses:v14 forKey:@"ySources"];
  ySources = v4->_ySources;
  v4->_ySources = (NSArray *)v15;

  uint64_t v17 = objc_opt_class();
  v18 = +[NSSet setWithObjects:](&off_26BEEB310, "setWithObjects:", v17, objc_opt_class(), 0);
  uint64_t v19 = [v3 decodeObjectOfClasses:v18 forKey:@"upSources"];
  upSources = v4->_upSources;
  v4->_upSources = (NSArray *)v19;

  uint64_t v21 = objc_opt_class();
  v22 = +[NSSet setWithObjects:](&off_26BEEB310, "setWithObjects:", v21, objc_opt_class(), 0);
  uint64_t v23 = [v3 decodeObjectOfClasses:v22 forKey:@"leftSources"];
  leftSources = v4->_leftSources;
  v4->_leftSources = (NSArray *)v23;

  uint64_t v25 = objc_opt_class();
  v26 = +[NSSet setWithObjects:](&off_26BEEB310, "setWithObjects:", v25, objc_opt_class(), 0);
  uint64_t v27 = [v3 decodeObjectOfClasses:v26 forKey:@"downSources"];
  downSources = v4->_downSources;
  v4->_downSources = (NSArray *)v27;

  uint64_t v29 = objc_opt_class();
  v30 = +[NSSet setWithObjects:](&off_26BEEB310, "setWithObjects:", v29, objc_opt_class(), 0);
  uint64_t v31 = [v3 decodeObjectOfClasses:v30 forKey:@"rightSources"];
  rightSources = v4->_rightSources;
  v4->_rightSources = (NSArray *)v31;

  v4->_analog = [v3 decodeBoolForKey:@"analog"];
  v4->_eventUpValueField = [v3 decodeIntegerForKey:@"eventUpValueField"];
  v4->_eventDownValueField = [v3 decodeIntegerForKey:@"eventDownValueField"];
  v4->_eventLeftValueField = [v3 decodeIntegerForKey:@"eventLeftValueField"];
  uint64_t v33 = [v3 decodeIntegerForKey:@"eventRightValueField"];

  v4->_eventRightValueField = v33;
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GCDevicePhysicalInputDirectionPadElementDescription;
  id v4 = a3;
  [(GCDevicePhysicalInputElementDescription *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_xySources, @"xySources", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_xSources forKey:@"xSources"];
  [v4 encodeObject:self->_ySources forKey:@"ySources"];
  [v4 encodeObject:self->_upSources forKey:@"upSources"];
  [v4 encodeObject:self->_leftSources forKey:@"leftSources"];
  [v4 encodeObject:self->_downSources forKey:@"downSources"];
  [v4 encodeObject:self->_rightSources forKey:@"rightSources"];
  [v4 encodeBool:self->_analog forKey:@"analog"];
  [v4 encodeInteger:self->_eventUpValueField forKey:@"eventUpValueField"];
  [v4 encodeInteger:self->_eventDownValueField forKey:@"eventDownValueField"];
  [v4 encodeInteger:self->_eventLeftValueField forKey:@"eventLeftValueField"];
  [v4 encodeInteger:self->_eventRightValueField forKey:@"eventRightValueField"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)GCDevicePhysicalInputDirectionPadElementDescription;
  id v4 = [(GCDevicePhysicalInputElementDescription *)&v6 copyWithZone:a3];
  objc_storeStrong(v4 + 7, self->_xySources);
  objc_storeStrong(v4 + 8, self->_xSources);
  objc_storeStrong(v4 + 9, self->_ySources);
  objc_storeStrong(v4 + 10, self->_upSources);
  objc_storeStrong(v4 + 11, self->_leftSources);
  objc_storeStrong(v4 + 12, self->_downSources);
  objc_storeStrong(v4 + 13, self->_rightSources);
  *((unsigned char *)v4 + 48) = self->_analog;
  v4[14] = self->_eventUpValueField;
  v4[15] = self->_eventDownValueField;
  v4[16] = self->_eventLeftValueField;
  v4[17] = self->_eventRightValueField;
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (NSArray **)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_22;
  }
  v14.receiver = self;
  v14.super_class = (Class)GCDevicePhysicalInputDirectionPadElementDescription;
  if (![(GCDevicePhysicalInputElementDescription *)&v14 isEqual:v4]) {
    goto LABEL_22;
  }
  xySources = self->_xySources;
  if (xySources != v4[7] && !-[NSArray isEqual:](xySources, "isEqual:")) {
    goto LABEL_22;
  }
  if (((xSources = self->_xSources, xSources == v4[8]) || -[NSArray isEqual:](xSources, "isEqual:"))
    && ((ySources = self->_ySources, ySources == v4[9]) || -[NSArray isEqual:](ySources, "isEqual:"))
    && ((upSources = self->_upSources, upSources == v4[10]) || -[NSArray isEqual:](upSources, "isEqual:"))
    && ((leftSources = self->_leftSources, leftSources == v4[11])
     || -[NSArray isEqual:](leftSources, "isEqual:"))
    && ((downSources = self->_downSources, downSources == v4[12])
     || -[NSArray isEqual:](downSources, "isEqual:"))
    && ((rightSources = self->_rightSources, rightSources == v4[13])
     || -[NSArray isEqual:](rightSources, "isEqual:"))
    && self->_analog == *((unsigned __int8 *)v4 + 48)
    && (NSArray *)self->_eventUpValueField == v4[14]
    && (NSArray *)self->_eventDownValueField == v4[15]
    && (NSArray *)self->_eventLeftValueField == v4[16])
  {
    BOOL v12 = self->_eventRightValueField == (void)v4[17];
  }
  else
  {
LABEL_22:
    BOOL v12 = 0;
  }

  return v12;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)GCDevicePhysicalInputDirectionPadElementDescription;
  uint64_t v3 = [(GCDevicePhysicalInputElementDescription *)&v8 description];
  id v4 = (void *)v3;
  if (self->_analog) {
    objc_super v5 = @"analog";
  }
  else {
    objc_super v5 = @"digital";
  }
  objc_super v6 = +[NSString stringWithFormat:@"Direction Pad %@ %@ ⬆%#zx ➡%#zx ⬇%#zx ⬅%#zx", v3, v5, self->_eventUpValueField, self->_eventRightValueField, self->_eventDownValueField, self->_eventLeftValueField];

  return v6;
}

- (NSArray)xySources
{
  return self->_xySources;
}

- (void)setXySources:(id)a3
{
}

- (NSArray)xSources
{
  return self->_xSources;
}

- (void)setXSources:(id)a3
{
}

- (NSArray)ySources
{
  return self->_ySources;
}

- (void)setYSources:(id)a3
{
}

- (NSArray)upSources
{
  return self->_upSources;
}

- (void)setUpSources:(id)a3
{
}

- (NSArray)leftSources
{
  return self->_leftSources;
}

- (void)setLeftSources:(id)a3
{
}

- (NSArray)downSources
{
  return self->_downSources;
}

- (void)setDownSources:(id)a3
{
}

- (NSArray)rightSources
{
  return self->_rightSources;
}

- (void)setRightSources:(id)a3
{
}

- (BOOL)isAnalog
{
  return self->_analog;
}

- (void)setAnalog:(BOOL)a3
{
  self->_analog = a3;
}

- (unint64_t)eventUpValueField
{
  return self->_eventUpValueField;
}

- (void)setEventUpValueField:(unint64_t)a3
{
  self->_eventUpValueField = a3;
}

- (unint64_t)eventDownValueField
{
  return self->_eventDownValueField;
}

- (void)setEventDownValueField:(unint64_t)a3
{
  self->_eventDownValueField = a3;
}

- (unint64_t)eventLeftValueField
{
  return self->_eventLeftValueField;
}

- (void)setEventLeftValueField:(unint64_t)a3
{
  self->_eventLeftValueField = a3;
}

- (unint64_t)eventRightValueField
{
  return self->_eventRightValueField;
}

- (void)setEventRightValueField:(unint64_t)a3
{
  self->_eventRightValueField = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightSources, 0);
  objc_storeStrong((id *)&self->_downSources, 0);
  objc_storeStrong((id *)&self->_leftSources, 0);
  objc_storeStrong((id *)&self->_upSources, 0);
  objc_storeStrong((id *)&self->_ySources, 0);
  objc_storeStrong((id *)&self->_xSources, 0);

  objc_storeStrong((id *)&self->_xySources, 0);
}

@end