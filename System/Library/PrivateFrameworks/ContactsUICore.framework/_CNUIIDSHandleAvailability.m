@interface _CNUIIDSHandleAvailability
- (BOOL)isAvailable;
- (CNUIIDSHandle)handle;
- (NSString)description;
- (_CNUIIDSHandleAvailability)initWithHandle:(id)a3 available:(BOOL)a4;
@end

@implementation _CNUIIDSHandleAvailability

- (_CNUIIDSHandleAvailability)initWithHandle:(id)a3 available:(BOOL)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_CNUIIDSHandleAvailability;
  v8 = [(_CNUIIDSHandleAvailability *)&v12 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_handle, a3);
    v9->_available = a4;
    v10 = v9;
  }

  return v9;
}

- (NSString)description
{
  v3 = [MEMORY[0x263F335A8] descriptionBuilderWithObject:self];
  v4 = [(_CNUIIDSHandleAvailability *)self handle];
  v5 = objc_msgSend(v4, "_cnui_IDSIDRepresentation");
  id v6 = (id)[v3 appendName:@"handle" object:v5];

  id v7 = (id)objc_msgSend(v3, "appendName:BOOLValue:", @"available", -[_CNUIIDSHandleAvailability isAvailable](self, "isAvailable"));
  v8 = [v3 build];

  return (NSString *)v8;
}

- (CNUIIDSHandle)handle
{
  return self->_handle;
}

- (BOOL)isAvailable
{
  return self->_available;
}

- (void).cxx_destruct
{
}

@end