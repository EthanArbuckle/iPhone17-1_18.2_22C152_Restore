@interface MLRTask
+ (BOOL)supportsSecureCoding;
- (DESInternalDodMLTask)DESTask;
- (MLRTask)initWithCoder:(id)a3;
- (MLRTask)initWithDodMLTask:(id)a3;
- (MLRTask)initWithParameters:(id)a3 attachments:(id)a4;
- (MLRTask)initWithParameters:(id)a3 attachments:(id)a4 internalTask:(id)a5;
- (MLRTask)initWithParametersDict:(id)a3;
- (MLRTaskAttachments)attachments;
- (MLRTaskParameters)parameters;
- (id)description;
- (id)internalTask;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MLRTask

- (MLRTask)initWithParameters:(id)a3 attachments:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MLRTask;
  v9 = [(MLRTask *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_parameters, a3);
    objc_storeStrong((id *)&v10->_attachments, a4);
  }

  return v10;
}

- (MLRTask)initWithDodMLTask:(id)a3
{
  objc_storeStrong((id *)&self->_DESTask, a3);
  id v5 = a3;
  v6 = [MLRTaskParameters alloc];
  id v7 = [v5 recipe];
  id v8 = [(MLRTaskParameters *)v6 initWithDESRecipe:v7];
  v9 = [MLRTaskAttachments alloc];
  v10 = [v5 recipe];

  v11 = [(MLRTaskAttachments *)v9 initWithDESRecipe:v10];
  objc_super v12 = [(MLRTask *)self initWithParameters:v8 attachments:v11];

  return v12;
}

- (MLRTask)initWithParametersDict:(id)a3
{
  id v4 = a3;
  id v5 = [[MLRTaskParameters alloc] initWithParametersDict:v4];

  v6 = [MLRTaskAttachments alloc];
  id v7 = [(MLRTaskAttachments *)v6 initWithURLs:MEMORY[0x263EFFA68]];
  id v8 = [(MLRTask *)self initWithParameters:v5 attachments:v7];

  return v8;
}

- (MLRTask)initWithParameters:(id)a3 attachments:(id)a4 internalTask:(id)a5
{
  id v9 = a5;
  v10 = [(MLRTask *)self initWithParameters:a3 attachments:a4];
  v11 = v10;
  if (v10) {
    objc_storeStrong(&v10->_internalTask, a5);
  }

  return v11;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"%@\nparameters:\n\t%@\nattachmentURLs:\n\t%@\n", v5, self->_parameters, self->_attachments];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  parameters = self->_parameters;
  id v5 = a3;
  [v5 encodeObject:parameters forKey:@"parameters"];
  [v5 encodeObject:self->_attachments forKey:@"attachments"];
}

- (MLRTask)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"parameters"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"attachments"];

  id v7 = [(MLRTask *)self initWithParameters:v5 attachments:v6];
  return v7;
}

- (MLRTaskParameters)parameters
{
  return self->_parameters;
}

- (MLRTaskAttachments)attachments
{
  return self->_attachments;
}

- (DESInternalDodMLTask)DESTask
{
  return self->_DESTask;
}

- (id)internalTask
{
  return self->_internalTask;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_internalTask, 0);
  objc_storeStrong((id *)&self->_DESTask, 0);
  objc_storeStrong((id *)&self->_attachments, 0);

  objc_storeStrong((id *)&self->_parameters, 0);
}

@end