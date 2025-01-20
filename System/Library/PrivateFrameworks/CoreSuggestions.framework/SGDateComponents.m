@interface SGDateComponents
+ (BOOL)supportsSecureCoding;
+ (id)dateComponents:(id)a3 label:(id)a4 extractionInfo:(id)a5 withRecordId:(id)a6;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDateComponents:(id)a3;
- (NSDateComponents)dateComponents;
- (SGDateComponents)initWithCoder:(id)a3;
- (SGDateComponents)initWithDateComponents:(id)a3 label:(id)a4 extractionInfo:(id)a5 recordId:(id)a6;
- (id)dateString;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SGDateComponents

- (void).cxx_destruct
{
}

- (NSDateComponents)dateComponents
{
  return self->_dateComponents;
}

- (id)description
{
  id v3 = [NSString alloc];
  v4 = [(SGLabeledObject *)self label];
  uint64_t v5 = [v4 length];
  if (v5)
  {
    v6 = [(SGLabeledObject *)self label];
  }
  else
  {
    v6 = @"unlabeled";
  }
  v7 = self->_dateComponents;
  uint64_t v8 = [(NSDateComponents *)v7 year];
  id v9 = [NSString alloc];
  uint64_t v10 = [(NSDateComponents *)v7 month];
  uint64_t v11 = [(NSDateComponents *)v7 day];
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {

    uint64_t v12 = objc_msgSend(v9, "initWithFormat:", @"%ld/%ld", v10, v11, v17);
  }
  else
  {
    uint64_t v13 = [(NSDateComponents *)v7 year];

    uint64_t v12 = objc_msgSend(v9, "initWithFormat:", @"%ld/%ld/%ld", v10, v11, v13);
  }
  v14 = (void *)v12;
  v15 = (void *)[v3 initWithFormat:@"%@/'%@'", v6, v12];

  if (v5) {

  }
  return v15;
}

- (id)dateString
{
  NSInteger v3 = [(NSDateComponents *)self->_dateComponents year];
  id v4 = [NSString alloc];
  NSInteger v5 = [(NSDateComponents *)self->_dateComponents month];
  NSInteger v6 = [(NSDateComponents *)self->_dateComponents day];
  if (v3 == 0x7FFFFFFFFFFFFFFFLL) {
    v7 = objc_msgSend(v4, "initWithFormat:", @"%ld/%ld", v5, v6, v9);
  }
  else {
    v7 = objc_msgSend(v4, "initWithFormat:", @"%ld/%ld/%ld", v5, v6, -[NSDateComponents year](self->_dateComponents, "year"));
  }

  return v7;
}

- (unint64_t)hash
{
  return [(NSDateComponents *)self->_dateComponents hash];
}

- (BOOL)isEqualToDateComponents:(id)a3
{
  id v4 = a3;
  if ([(SGObject *)self isEqualToSuggestion:v4])
  {
    NSInteger v5 = self->_dateComponents;
    NSInteger v6 = v5;
    if (v5 == (NSDateComponents *)v4[5]) {
      char v7 = 1;
    }
    else {
      char v7 = -[NSDateComponents isEqual:](v5, "isEqual:");
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SGDateComponents *)a3;
  NSInteger v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(SGDateComponents *)self isEqualToDateComponents:v5];

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SGDateComponents;
  id v4 = a3;
  [(SGLabeledObject *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_dateComponents, @"dateComponents", v5.receiver, v5.super_class);
}

- (SGDateComponents)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SGDateComponents;
  objc_super v5 = [(SGLabeledObject *)&v10 initWithCoder:v4];
  if (v5)
  {
    BOOL v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"dateComponents"];
    dateComponents = v5->_dateComponents;
    v5->_dateComponents = (NSDateComponents *)v7;
  }
  return v5;
}

- (SGDateComponents)initWithDateComponents:(id)a3 label:(id)a4 extractionInfo:(id)a5 recordId:(id)a6
{
  id v10 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SGDateComponents;
  uint64_t v11 = [(SGLabeledObject *)&v15 initWithLabel:a4 extractionInfo:a5 recordId:a6];
  if (v11)
  {
    uint64_t v12 = [v10 copy];
    dateComponents = v11->_dateComponents;
    v11->_dateComponents = (NSDateComponents *)v12;
  }
  return v11;
}

+ (id)dateComponents:(id)a3 label:(id)a4 extractionInfo:(id)a5 withRecordId:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = [[SGDateComponents alloc] initWithDateComponents:v12 label:v11 extractionInfo:v10 recordId:v9];

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end