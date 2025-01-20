@interface SGModelHead
- (NSArray)labels;
- (NSString)name;
- (SGModelHead)initWithDictionary:(id)a3 key:(id)a4;
- (unint64_t)numberOfDimensions;
@end

@implementation SGModelHead

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labels, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (NSArray)labels
{
  return self->_labels;
}

- (unint64_t)numberOfDimensions
{
  return self->_numberOfDimensions;
}

- (NSString)name
{
  return self->_name;
}

- (SGModelHead)initWithDictionary:(id)a3 key:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  v9 = v8;
  if (!v8)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      v23 = &_os_log_internal;
      v24 = "dictionary";
      goto LABEL_25;
    }
    goto LABEL_9;
  }

  v25.receiver = self;
  v25.super_class = (Class)SGModelHead;
  v10 = [(SGModelHead *)&v25 init];
  self = v10;
  if (!v10)
  {
LABEL_16:
    self = self;
    v18 = self;
    goto LABEL_17;
  }
  objc_storeStrong((id *)&v10->_name, a4);
  v11 = [v9 objectForKeyedSubscript:@"LABELS"];
  labels = self->_labels;
  self->_labels = v11;

  if (!self->_labels)
  {
    v19 = 0;
    goto LABEL_12;
  }
  v13 = [v9 objectForKeyedSubscript:@"NUMBER_OF_DIMENSIONS"];

  if (!v13)
  {
    v19 = self->_labels;
LABEL_12:
    unint64_t v17 = [(NSArray *)v19 count];
    if (v17) {
      goto LABEL_13;
    }
    v20 = [v9 numberAssertedForKey:@"NUMBER_OF_DIMENSIONS"];
    if (v20)
    {
      v21 = v20;
      self->_numberOfDimensions = [v20 unsignedIntegerValue];

      goto LABEL_16;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      v23 = &_os_log_internal;
      v24 = "[dictionary numberAssertedForKey:@\"NUMBER_OF_DIMENSIONS\"]";
      goto LABEL_25;
    }
    goto LABEL_9;
  }
  v14 = [v9 numberAssertedForKey:@"NUMBER_OF_DIMENSIONS"];
  if (v14)
  {
    v15 = v14;
    uint64_t v16 = [v14 unsignedIntegerValue];

    if ([(NSArray *)self->_labels count] == v16)
    {
      unint64_t v17 = [(NSArray *)self->_labels count];
LABEL_13:
      self->_numberOfDimensions = v17;
      goto LABEL_16;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      v23 = &_os_log_internal;
      v24 = "_labels.count == numberOfDimensions";
      goto LABEL_25;
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    v23 = &_os_log_internal;
    v24 = "[dictionary numberAssertedForKey:@\"NUMBER_OF_DIMENSIONS\"]";
LABEL_25:
    _os_log_fault_impl(&dword_226E32000, v23, OS_LOG_TYPE_FAULT, v24, buf, 2u);
  }
LABEL_9:
  v18 = 0;
LABEL_17:

  return v18;
}

@end