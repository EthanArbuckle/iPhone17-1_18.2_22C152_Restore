@interface NSXPCEncoder
- (BOOL)allowsKeyedCoding;
- (NSXPCEncoder)init;
- (NSXPCEncoder)initWithStackSpace:(char *)a3 size:(unint64_t)a4;
- (NSXPCEncoderDelegate)delegate;
- (id)_newRootXPCObject;
- (id)_replaceObject:(id)a3;
- (id)connection;
- (id)debugDescription;
- (id)finishEncoding;
- (unint64_t)_addOOLXPCObject:(id)a3;
- (void)_checkObject:(id)a3;
- (void)_encodeArrayOfObjects:(id)a3 forKey:(id)a4;
- (void)_encodeCString:(const char *)a3 length:(unint64_t)a4 forKey:(id)a5;
- (void)_encodeInvocation:(id)a3 isReply:(BOOL)a4 into:(id)a5;
- (void)_encodeInvocationObjectArgumentsOnly:(id *)a3 count:(unint64_t)a4 typeString:(const char *)a5 selector:(SEL)a6 isReply:(BOOL)a7 into:(id)a8;
- (void)_encodeObject:(id)a3;
- (void)_encodeUnkeyedObject:(id)a3;
- (void)_setConnection:(id)a3;
- (void)beginEncoding;
- (void)dealloc;
- (void)encodeBool:(BOOL)a3 forKey:(id)a4;
- (void)encodeBytes:(const char *)a3 length:(unint64_t)a4 forKey:(id)a5;
- (void)encodeConditionalObject:(id)a3 forKey:(id)a4;
- (void)encodeDouble:(double)a3 forKey:(id)a4;
- (void)encodeFloat:(float)a3 forKey:(id)a4;
- (void)encodeInt32:(int)a3 forKey:(id)a4;
- (void)encodeInt64:(int64_t)a3 forKey:(id)a4;
- (void)encodeInt:(int)a3 forKey:(id)a4;
- (void)encodeInteger:(int64_t)a3 forKey:(id)a4;
- (void)encodeObject:(id)a3;
- (void)encodeObject:(id)a3 forKey:(id)a4;
- (void)encodeValueOfObjCType:(const char *)a3 at:(const void *)a4;
- (void)encodeXPCObject:(id)a3 forKey:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation NSXPCEncoder

- (void)_encodeArrayOfObjects:(id)a3 forKey:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  p_encoder = &self->_encoder;
  _NSXPCSerializationAddString((uint64_t)&self->_encoder, (CFStringRef)a4, 1);
  _NSXPCSerializationStartArrayWrite((uint64_t *)p_encoder);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v7 = [a3 countByEnumeratingWithState:&v12 objects:v11 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(a3);
        }
        [(NSXPCEncoder *)self _encodeUnkeyedObject:*(void *)(*((void *)&v12 + 1) + 8 * v10++)];
      }
      while (v8 != v10);
      uint64_t v8 = [a3 countByEnumeratingWithState:&v12 objects:v11 count:16];
    }
    while (v8);
  }
  _NSXPCSerializationEndArrayWrite(p_encoder);
}

- (void)_encodeObject:(id)a3
{
  p_encoder = &self->_encoder;
  if (a3)
  {
    objectReferences = self->_encoder._objectReferences;
    if (objectReferences)
    {
      Value = CFDictionaryGetValue(objectReferences, a3);
      if (Value)
      {
        _NSXPCSerializationAddReference((uint64_t)p_encoder, (unint64_t)Value);
        return;
      }
    }
    if ([a3 _allowsDirectEncoding])
    {
      if (_NSIsNSString())
      {
        _NSXPCSerializationAddString((uint64_t)p_encoder, (CFStringRef)a3, 0);
        return;
      }
      if (_NSIsNSNumber())
      {
        _NSXPCSerializationAddNumber((uint64_t)p_encoder, (CFNumberRef)a3);
        return;
      }
      if (_NSIsNSData())
      {
        _NSXPCSerializationAddData((uint64_t)p_encoder, (CFDataRef)a3);
        return;
      }
    }
    else
    {
      _NSXPCSerializationAddObjectRef((uint64_t)p_encoder, a3);
    }
    unint64_t genericIndex = self->_genericIndex;
    self->_unint64_t genericIndex = 0;
    _NSXPCSerializationStartDictionaryWrite((uint64_t *)p_encoder);
    BOOL askForReplacement = self->_askForReplacement;
    self->_BOOL askForReplacement = 0;
    Class = object_getClass(a3);
    if (class_isMetaClass(Class))
    {
      uint64_t v16 = +[NSString stringWithFormat:@"%@: Class objects may not be encoded at this time.", _NSMethodExceptionProem((objc_class *)self, a2)];
    }
    else
    {
      long long v13 = (objc_class *)[a3 classForCoder];
      if (v13)
      {
        Name = (char *)class_getName(v13);
        _NSXPCSerializationAddASCIIString((uint64_t)p_encoder, "$class", 6, 1);
        size_t v15 = strlen(Name);
        _NSXPCSerializationAddASCIIString((uint64_t)p_encoder, Name, v15, 1);
        self->_BOOL askForReplacement = askForReplacement;
        if (objc_opt_isKindOfClass())
        {
          _NSXPCSerializationAddASCIIString((uint64_t)p_encoder, "$xpc", 4, 1);
          _NSXPCSerializationAddInteger((uint64_t)p_encoder, [(NSXPCEncoder *)self _addOOLXPCObject:a3]);
        }
        else
        {
          [a3 encodeWithCoder:self];
        }
        _NSXPCSerializationEndArrayWrite(p_encoder);
        self->_unint64_t genericIndex = genericIndex;
        return;
      }
      uint64_t v16 = +[NSString stringWithFormat:@"%@: Unable to determine what Class the encoded object should encode (classForCoder returned nil)", _NSMethodExceptionProem((objc_class *)self, a2)];
    }
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v16 userInfo:0]);
  }
  uint64_t v9 = &self->_encoder;

  _NSXPCSerializationAddNull((uint64_t)v9);
}

- (void)encodeObject:(id)a3 forKey:(id)a4
{
  id v6 = [(NSXPCEncoder *)self _replaceObject:a3];
  [(NSXPCEncoder *)self _checkObject:v6];
  p_encoder = &self->_encoder;
  if (a4) {
    _NSXPCSerializationAddString((uint64_t)p_encoder, (CFStringRef)a4, 1);
  }
  else {
    _NSXPCSerializationAddNull((uint64_t)p_encoder);
  }

  [(NSXPCEncoder *)self _encodeObject:v6];
}

- (void)_encodeUnkeyedObject:(id)a3
{
  id v4 = [(NSXPCEncoder *)self _replaceObject:a3];
  [(NSXPCEncoder *)self _checkObject:v4];

  [(NSXPCEncoder *)self _encodeObject:v4];
}

- (id)_replaceObject:(id)a3
{
  id v3 = a3;
  value[1] = *(void **)MEMORY[0x1E4F143B8];
  value[0] = a3;
  if (self->_askForReplacement)
  {
    if (a3)
    {
      id v6 = (id)[a3 replacementObjectForCoder:self];
      if (v6 == v3 || (value[0] = v6, (id v3 = v6) != 0))
      {
        if (objc_loadWeak((id *)&self->_delegate))
        {
          replacedByDelegateObjects = self->_replacedByDelegateObjects;
          if (replacedByDelegateObjects
            && CFDictionaryGetValueIfPresent(replacedByDelegateObjects, v3, (const void **)value))
          {
            return value[0];
          }
          else
          {
            id Weak = objc_loadWeak((id *)&self->_delegate);
            uint64_t v9 = (void *)[Weak replacementObjectForEncoder:self object:value[0]];
            if (!v9)
            {
              long long v13 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: The replacement object must not be nil.", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
              objc_exception_throw(v13);
            }
            id v3 = v9;
            uint64_t v10 = value[0];
            if (v9 != value[0])
            {
              Mutable = self->_replacedByDelegateObjects;
              if (!Mutable)
              {
                Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CFB0], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
                self->_replacedByDelegateObjects = Mutable;
                uint64_t v10 = value[0];
              }
              CFDictionarySetValue(Mutable, v10, v3);
            }
          }
        }
      }
    }
  }
  return v3;
}

- (void)_checkObject:(id)a3
{
  if (!a3) {
    return;
  }
  uint64_t v6 = objc_opt_class();
  if (!v6)
  {
    v11 = +[NSString stringWithFormat:@"%@: An object had no class.", _NSMethodExceptionProem((objc_class *)self, a2), v14];
    goto LABEL_14;
  }
  uint64_t v7 = v6;
  connection = self->_connection;
  if (connection
    && (-[_NSXPCConnectionClassCache containsClass:]((os_unfair_lock_s *)connection->_eCache, v6) & 1) != 0)
  {
    return;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0
    && ([a3 conformsToProtocol:&unk_1ECABCCC8] & 1) == 0
    && (objc_opt_isKindOfClass() & 1) == 0)
  {
    long long v12 = _NSMethodExceptionProem((objc_class *)self, a2);
    long long v13 = (objc_class *)objc_opt_class();
    v11 = +[NSString stringWithFormat:@"%@: This coder only encodes objects that adopt NSSecureCoding (object is of class '%s').", v12, class_getName(v13)];
LABEL_14:
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v11 userInfo:0]);
  }
  uint64_t v9 = self->_connection;
  if (v9)
  {
    uint64_t eCache = (uint64_t)v9->_eCache;
    -[_NSXPCConnectionClassCache addClass:](eCache, v7);
  }
}

- (void)encodeBool:(BOOL)a3 forKey:(id)a4
{
  BOOL v4 = a3;
  p_encoder = &self->_encoder;
  _NSXPCSerializationAddString((uint64_t)&self->_encoder, (CFStringRef)a4, 1);

  _NSXPCSerializationAddBool((uint64_t)p_encoder, v4);
}

- (void)encodeDouble:(double)a3 forKey:(id)a4
{
  p_encoder = &self->_encoder;
  _NSXPCSerializationAddString((uint64_t)&self->_encoder, (CFStringRef)a4, 1);

  _NSXPCSerializationAddDouble((uint64_t)p_encoder, a3);
}

- (void)encodeInt32:(int)a3 forKey:(id)a4
{
  p_encoder = &self->_encoder;
  _NSXPCSerializationAddString((uint64_t)&self->_encoder, (CFStringRef)a4, 1);

  _NSXPCSerializationAddInteger((uint64_t)p_encoder, a3);
}

- (void)encodeFloat:(float)a3 forKey:(id)a4
{
  p_encoder = &self->_encoder;
  _NSXPCSerializationAddString((uint64_t)&self->_encoder, (CFStringRef)a4, 1);

  _NSXPCSerializationAddFloat((uint64_t)p_encoder, a3);
}

- (void).cxx_destruct
{
}

- (BOOL)allowsKeyedCoding
{
  return 1;
}

- (void)encodeBytes:(const char *)a3 length:(unint64_t)a4 forKey:(id)a5
{
  if (!a3 && a4)
  {
    uint64_t v7 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: argument inconsistency: bytes pointer is null but length (%ld) is not zero", _NSMethodExceptionProem((objc_class *)self, a2), a4), 0 reason userInfo];
    objc_exception_throw(v7);
  }
  CFDataRef v8 = (const __CFData *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:a3 length:a4];
  _NSXPCSerializationAddString((uint64_t)&self->_encoder, (CFStringRef)a5, 1);
  _NSXPCSerializationAddData((uint64_t)&self->_encoder, v8);
}

- (void)_encodeInvocation:(id)a3 isReply:(BOOL)a4 into:(id)a5
{
  BOOL v6 = a4;
  unint64_t genericIndex = self->_genericIndex;
  self->_unint64_t genericIndex = 0;
  p_encoder = &self->_encoder;
  _NSXPCSerializationStartArrayWrite((uint64_t *)&self->_encoder);
  if (v6)
  {
    _NSXPCSerializationAddNull((uint64_t)p_encoder);
    int v11 = 1;
  }
  else
  {
    Name = (char *)sel_getName((SEL)[a3 selector]);
    size_t v13 = strlen(Name);
    _NSXPCSerializationAddASCIIString((uint64_t)p_encoder, Name, v13, 0);
    int v11 = 2;
  }
  uint64_t v14 = (void *)[a3 methodSignature];
  size_t v15 = (char *)[v14 _cTypeString];
  size_t v16 = strlen(v15);
  _NSXPCSerializationAddASCIIString((uint64_t)p_encoder, v15, v16, 0);
  self->_BOOL askForReplacement = 1;
  _NSXPCSerializationAddInvocationArgumentsArray(a3, v14, self, (uint64_t *)p_encoder, v11);
  self->_BOOL askForReplacement = 0;
  _NSXPCSerializationEndArrayWrite(p_encoder);
  self->_unint64_t genericIndex = genericIndex;
  xpc_object_t v17 = _NSXPCSerializationCreateWriteData((uint64_t)p_encoder);
  if (!v17) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NSCoder is unable to serialize objects to be sent" userInfo:0]);
  }
  v18 = v17;
  self->_finished = 1;
  xpc_dictionary_set_value(a5, "root", v17);
  xpc_release(v18);
  oolObjects = self->_oolObjects;
  if (oolObjects)
  {
    xpc_dictionary_set_value(a5, "ool", oolObjects);
  }
}

- (void)_encodeInvocationObjectArgumentsOnly:(id *)a3 count:(unint64_t)a4 typeString:(const char *)a5 selector:(SEL)a6 isReply:(BOOL)a7 into:(id)a8
{
  BOOL v9 = a7;
  unint64_t genericIndex = self->_genericIndex;
  self->_unint64_t genericIndex = 0;
  p_encoder = &self->_encoder;
  _NSXPCSerializationStartArrayWrite((uint64_t *)&self->_encoder);
  if (v9)
  {
    _NSXPCSerializationAddNull((uint64_t)p_encoder);
  }
  else
  {
    Name = (char *)sel_getName(a6);
    size_t v18 = strlen(Name);
    _NSXPCSerializationAddASCIIString((uint64_t)p_encoder, Name, v18, 0);
  }
  size_t v19 = strlen(a5);
  _NSXPCSerializationAddASCIIString((uint64_t)p_encoder, (void *)a5, v19, 0);
  self->_BOOL askForReplacement = 1;
  _NSXPCSerializationAddInvocationWithOnlyObjectArgumentsArray((SEL *)a3, a4, self, (uint64_t *)p_encoder);
  self->_BOOL askForReplacement = 0;
  _NSXPCSerializationEndArrayWrite(p_encoder);
  self->_unint64_t genericIndex = genericIndex;
  xpc_object_t v20 = _NSXPCSerializationCreateWriteData((uint64_t)p_encoder);
  if (!v20) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NSCoder is unable to serialize objects to be sent" userInfo:0]);
  }
  v21 = v20;
  self->_finished = 1;
  xpc_dictionary_set_value(a8, "root", v20);
  xpc_release(v21);
  oolObjects = self->_oolObjects;
  if (oolObjects)
  {
    xpc_dictionary_set_value(a8, "ool", oolObjects);
  }
}

- (void)encodeInteger:(int64_t)a3 forKey:(id)a4
{
  p_encoder = &self->_encoder;
  _NSXPCSerializationAddString((uint64_t)&self->_encoder, (CFStringRef)a4, 1);

  _NSXPCSerializationAddInteger((uint64_t)p_encoder, a3);
}

- (void)encodeValueOfObjCType:(const char *)a3 at:(const void *)a4
{
  p_encoder = &self->_encoder;
  _NSXPCSerializationAddNull((uint64_t)&self->_encoder);
  _NSXPCSerializationStartArrayWrite((uint64_t *)p_encoder);
  _NSXPCSerializationAddTypedObjCValuesToArray(self, (uint64_t)p_encoder, a3, (SEL *)a4);

  _NSXPCSerializationEndArrayWrite(p_encoder);
}

- (void)encodeInt:(int)a3 forKey:(id)a4
{
  p_encoder = &self->_encoder;
  _NSXPCSerializationAddString((uint64_t)&self->_encoder, (CFStringRef)a4, 1);

  _NSXPCSerializationAddInteger((uint64_t)p_encoder, a3);
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  oolObjects = self->_oolObjects;
  if (oolObjects) {
    xpc_release(oolObjects);
  }
  replacedByDelegateObjects = self->_replacedByDelegateObjects;
  if (replacedByDelegateObjects) {
    CFRelease(replacedByDelegateObjects);
  }
  if (!self->_finished)
  {
    xpc_object_t v5 = _NSXPCSerializationCreateWriteData((uint64_t)&self->_encoder);
    xpc_release(v5);
  }

  v6.receiver = self;
  v6.super_class = (Class)NSXPCEncoder;
  [(NSXPCCoder *)&v6 dealloc];
}

- (void)setDelegate:(id)a3
{
}

- (void)_setConnection:(id)a3
{
  connection = self->_connection;
  if (connection != a3)
  {

    self->_connection = (NSXPCConnection *)a3;
  }
}

- (NSXPCEncoder)initWithStackSpace:(char *)a3 size:(unint64_t)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)NSXPCEncoder;
  objc_super v6 = [(NSXPCCoder *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    _NSXPCSerializationStartWrite((uint64_t)&v6->_encoder, (uint64_t)a3, a4);
  }
  return v7;
}

- (NSXPCEncoder)init
{
  return [(NSXPCEncoder *)self initWithStackSpace:0 size:0];
}

- (id)finishEncoding
{
  id v2 = [(NSXPCEncoder *)self _newRootXPCObject];

  return v2;
}

- (id)_newRootXPCObject
{
  if (self->_topLevelDictionary) {
    _NSXPCSerializationEndArrayWrite(self->_encoder.collectionSizeOffset);
  }
  xpc_object_t v3 = _NSXPCSerializationCreateWriteData((uint64_t)&self->_encoder);
  if (!v3) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NSCoder is unable to serialize objects to be sent" userInfo:0]);
  }
  BOOL v4 = v3;
  self->_finished = 1;
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_value(v5, "root", v4);
  xpc_release(v4);
  oolObjects = self->_oolObjects;
  if (oolObjects) {
    xpc_dictionary_set_value(v5, "ool", oolObjects);
  }
  return v5;
}

- (void)beginEncoding
{
  self->_topLevelDictionary = 1;
  _NSXPCSerializationStartDictionaryWrite((uint64_t *)&self->_encoder);
}

- (void)encodeInt64:(int64_t)a3 forKey:(id)a4
{
  p_encoder = &self->_encoder;
  _NSXPCSerializationAddString((uint64_t)&self->_encoder, (CFStringRef)a4, 1);

  _NSXPCSerializationAddInteger((uint64_t)p_encoder, a3);
}

- (id)connection
{
  id v2 = self->_connection;

  return v2;
}

- (void)encodeXPCObject:(id)a3 forKey:(id)a4
{
  p_encoder = &self->_encoder;
  _NSXPCSerializationAddString((uint64_t)&self->_encoder, (CFStringRef)a4, 1);
  unint64_t v7 = [(NSXPCEncoder *)self _addOOLXPCObject:a3];

  _NSXPCSerializationAddInteger((uint64_t)p_encoder, v7);
}

- (unint64_t)_addOOLXPCObject:(id)a3
{
  v8[1] = *(xpc_object_t *)MEMORY[0x1E4F143B8];
  v8[0] = a3;
  oolObjects = self->_oolObjects;
  if (oolObjects)
  {
    size_t count = xpc_array_get_count(oolObjects);
    xpc_array_append_value(self->_oolObjects, a3);
    return count;
  }
  else
  {
    self->_oolObjects = (OS_xpc_object *)xpc_array_create(v8, 1uLL);
    return 0;
  }
}

- (id)debugDescription
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)NSXPCEncoder;
  return [(NSXPCEncoder *)&v3 debugDescription];
}

- (void)encodeObject:(id)a3
{
}

- (void)_encodeCString:(const char *)a3 length:(unint64_t)a4 forKey:(id)a5
{
  p_encoder = &self->_encoder;
  _NSXPCSerializationAddString((uint64_t)&self->_encoder, (CFStringRef)a5, 1);

  _NSXPCSerializationAddASCIIString((uint64_t)p_encoder, (void *)a3, a4, 1);
}

- (void)encodeConditionalObject:(id)a3 forKey:(id)a4
{
  uint64_t v4 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: This coder subclass does not support this method.", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
  objc_exception_throw(v4);
}

- (NSXPCEncoderDelegate)delegate
{
  return (NSXPCEncoderDelegate *)objc_loadWeak((id *)&self->_delegate);
}

@end