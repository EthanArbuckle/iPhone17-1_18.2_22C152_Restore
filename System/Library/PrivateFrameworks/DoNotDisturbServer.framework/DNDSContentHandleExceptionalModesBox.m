@interface DNDSContentHandleExceptionalModesBox
- (DNDContactHandle)contactHandle;
- (DNDSContentHandleExceptionalModesBox)initWithContactHandle:(id)a3 allowed:(id)a4 silenced:(id)a5;
- (NSArray)allowed;
- (NSArray)silenced;
@end

@implementation DNDSContentHandleExceptionalModesBox

- (DNDSContentHandleExceptionalModesBox)initWithContactHandle:(id)a3 allowed:(id)a4 silenced:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)DNDSContentHandleExceptionalModesBox;
  v11 = [(DNDSContentHandleExceptionalModesBox *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    contactHandle = v11->_contactHandle;
    v11->_contactHandle = (DNDContactHandle *)v12;

    uint64_t v14 = [v9 copy];
    allowed = v11->_allowed;
    v11->_allowed = (NSArray *)v14;

    uint64_t v16 = [v10 copy];
    silenced = v11->_silenced;
    v11->_silenced = (NSArray *)v16;
  }
  return v11;
}

- (DNDContactHandle)contactHandle
{
  return self->_contactHandle;
}

- (NSArray)allowed
{
  return self->_allowed;
}

- (NSArray)silenced
{
  return self->_silenced;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_silenced, 0);
  objc_storeStrong((id *)&self->_allowed, 0);
  objc_storeStrong((id *)&self->_contactHandle, 0);
}

@end