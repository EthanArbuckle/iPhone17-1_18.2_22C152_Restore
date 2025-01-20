@interface _GCGamepadEventFusionConfig
+ (BOOL)supportsSecureCoding;
- (_GCGamepadEventFusionConfig)init;
- (_GCGamepadEventFusionConfig)initWithCoder:(id)a3;
- (_GCGamepadEventFusionConfig)initWithSourceCount:(unint64_t)a3;
- (id)debugDescription;
- (unint64_t)sourceCount;
- (unsigned)passRuleForElement:(int64_t)a3 forSourceAtIndex:(unint64_t)a4;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateElementsForSourceAtIndex:(unint64_t)a3 withBlock:(id)a4;
- (void)setPassRule:(unsigned __int8)a3 forElement:(int64_t)a4 forSourceAtIndex:(unint64_t)a5;
@end

@implementation _GCGamepadEventFusionConfig

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_GCGamepadEventFusionConfig)initWithSourceCount:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_GCGamepadEventFusionConfig;
  v4 = [(_GCGamepadEventFusionConfig *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_sourceCount = a3;
    if (a3) {
      v4->_matrix = (unsigned __int8 (*)[47])malloc_type_calloc(a3, 0x2FuLL, 0x10000408E6526DAuLL);
    }
  }
  return v5;
}

- (_GCGamepadEventFusionConfig)init
{
  return [(_GCGamepadEventFusionConfig *)self initWithSourceCount:0];
}

- (_GCGamepadEventFusionConfig)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_GCGamepadEventFusionConfig;
  v5 = [(_GCGamepadEventFusionConfig *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeIntegerForKey:@"sourceCount"];
    v5->_sourceCount = v6;
    if (v6)
    {
      unint64_t v11 = 0;
      objc_super v7 = (const void *)[v4 decodeBytesForKey:@"matrix" returnedLength:&v11];
      v8 = (unsigned __int8 (*)[47])malloc_type_calloc(v5->_sourceCount, 0x2FuLL, 0x10000408E6526DAuLL);
      v5->_matrix = v8;
      if (v11 >= 47 * v5->_sourceCount) {
        size_t v9 = 47 * v5->_sourceCount;
      }
      else {
        size_t v9 = v11;
      }
      memcpy(v8, v7, v9);
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t sourceCount = self->_sourceCount;
  id v5 = a3;
  [v5 encodeInteger:sourceCount forKey:@"sourceCount"];
  [v5 encodeBytes:self->_matrix length:47 * self->_sourceCount forKey:@"matrix"];
}

- (void)dealloc
{
  matrix = self->_matrix;
  if (matrix) {
    free(matrix);
  }
  v4.receiver = self;
  v4.super_class = (Class)_GCGamepadEventFusionConfig;
  [(_GCGamepadEventFusionConfig *)&v4 dealloc];
}

- (id)debugDescription
{
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472;
  v48[2] = __47___GCGamepadEventFusionConfig_debugDescription__block_invoke;
  v48[3] = &unk_26D22CAA8;
  v48[4] = self;
  v2 = (void (**)(void, void))MEMORY[0x223C6E420](v48, a2);
  uint64_t v21 = objc_opt_class();
  v46 = v2[2](v2, 0);
  v47 = v2[2](v2, 1);
  v44 = v2[2](v2, 2);
  v45 = v2[2](v2, 3);
  v42 = v2[2](v2, 4);
  v43 = v2[2](v2, 5);
  v40 = v2[2](v2, 6);
  v41 = v2[2](v2, 7);
  v38 = v2[2](v2, 8);
  v39 = v2[2](v2, 9);
  v37 = v2[2](v2, 10);
  v36 = v2[2](v2, 11);
  v35 = v2[2](v2, 12);
  v34 = v2[2](v2, 13);
  v33 = v2[2](v2, 14);
  v32 = v2[2](v2, 15);
  v31 = v2[2](v2, 16);
  v20 = v2[2](v2, 17);
  v19 = v2[2](v2, 18);
  v30 = v2[2](v2, 19);
  v18 = v2[2](v2, 20);
  v29 = v2[2](v2, 21);
  v16 = v2[2](v2, 22);
  v28 = v2[2](v2, 23);
  v15 = v2[2](v2, 24);
  v14 = v2[2](v2, 25);
  v13 = v2[2](v2, 26);
  v27 = v2[2](v2, 27);
  v26 = v2[2](v2, 28);
  v25 = v2[2](v2, 29);
  v24 = v2[2](v2, 30);
  v23 = v2[2](v2, 31);
  objc_super v12 = v2[2](v2, 32);
  size_t v9 = v2[2](v2, 33);
  unint64_t v11 = v2[2](v2, 34);
  v10 = v2[2](v2, 35);
  v8 = v2[2](v2, 36);
  objc_super v7 = v2[2](v2, 37);
  uint64_t v6 = v2[2](v2, 38);
  v3 = v2[2](v2, 39);
  objc_super v4 = v2[2](v2, 40);
  +[NSString stringWithFormat:](&off_26D2B6E68, "stringWithFormat:", @"<%@ %p> {\n\t.DpadUp: %@\n\t.DpadDown: %@\n\t.DpadLeft: %@\n\t.DpadRight: %@\n\t.ButtonA: %@\n\t.ButtonB: %@\n\t.ButtonX: %@\n\t.ButtonY: %@\n\t.LeftShoulder: %@\n\t.RightShoulder: %@\n\t.LeftThumbstickUp: %@\n\t.LeftThumbstickDown: %@\n\t.LeftThumbstickLeft: %@\n\t.LeftThumbstickRight: %@\n\t.RightThumbstickUp: %@\n\t.RightThumbstickDown: %@\n\t.RightThumbstickLeft: %@\n\t.RightThumbstickRight: %@\n\t.LeftTrigger: %@\n\t.RightTrigger: %@\n\t.LeftThumbstickButton: %@\n\t.RightThumbstickButton: %@\n\t.ButtonHome: %@\n\t.ButtonMenu: %@\n\t.ButtonOptions: %@\n\t.ButtonSpecial0: %@\n\t.ButtonSpecial1: %@\n\t.ButtonSpecial2: %@\n\t.ButtonSpecial3: %@\n\t.ButtonSpecial4: %@\n\t.ButtonSpecial5: %@\n\t.ButtonSpecial6: %@\n\t.ButtonSpecial7: %@\n\t.ButtonSpecial8: %@\n\t.ButtonSpecial9: %@\n\t.ButtonSpecial10: %@\n\t.ButtonSpecial11: %@\n\t.ButtonSpecial12: %@\n\t.ButtonSpecial13: %@\n\t.ButtonSpecial14: %@\n\t.ButtonShare: %@\n}", v21, self, v46, v47, v44, v45, v42, v43, v40, v41, v38, v39, v37, v36, v35, v34,
    v33,
    v32,
    v31,
    v20,
    v19,
    v30,
    v18,
    v29,
    v16,
    v28,
    v15,
    v14,
    v13,
    v27,
    v26,
    v25,
    v24,
    v23,
    v12,
    v9,
    v11,
    v10,
    v8,
    v7,
    v6,
    v3,
    v4);
  id v22 = (id)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (void)setPassRule:(unsigned __int8)a3 forElement:(int64_t)a4 forSourceAtIndex:(unint64_t)a5
{
  unint64_t sourceCount = self->_sourceCount;
  if (sourceCount <= a5)
  {
    unint64_t v11 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_GCGamepadEventFusion.m", 174, @"Invalid sourceIndex (%llu).  Greater than _sourceCount (%llu)", a5, self->_sourceCount);

    unint64_t sourceCount = self->_sourceCount;
  }
  if (sourceCount > a5)
  {
    if (a4 >= 47)
    {
      unk_26D2B54B8(&off_26D2B5620, "currentHandler");
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_GCGamepadEventFusion.m", 179, @"Invalid element (%llu)", a4);
    }
    else
    {
      self->_matrix[a5][a4] = a3;
    }
  }
}

- (unsigned)passRuleForElement:(int64_t)a3 forSourceAtIndex:(unint64_t)a4
{
  unint64_t sourceCount = self->_sourceCount;
  if (sourceCount <= a4)
  {
    v10 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_GCGamepadEventFusion.m", 197, @"Invalid sourceIndex (%llu).  Greater than _sourceCount (%llu)", a4, self->_sourceCount);

    unint64_t sourceCount = self->_sourceCount;
  }
  if (sourceCount > a4)
  {
    if (a3 < 47) {
      return self->_matrix[a4][a3];
    }
    unint64_t v11 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_GCGamepadEventFusion.m", 202, @"Invalid element (%llu)", a3);
  }
  return 0;
}

- (void)enumerateElementsForSourceAtIndex:(unint64_t)a3 withBlock:(id)a4
{
  id v7 = a4;
  unint64_t sourceCount = self->_sourceCount;
  if (sourceCount <= a3)
  {
    id v13 = v7;
    unint64_t v11 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_GCGamepadEventFusion.m", 212, @"Invalid sourceIndex (%llu).  Greater than _sourceCount (%llu)", a3, self->_sourceCount);

    id v7 = v13;
    unint64_t sourceCount = self->_sourceCount;
  }
  if (sourceCount > a3)
  {
    uint64_t v9 = 0;
    unint64_t v10 = a3;
    id v12 = v7;
    do
    {
      (*((void (**)(id, uint64_t, void))v7 + 2))(v12, v9, self->_matrix[v10][v9]);
      id v7 = v12;
      ++v9;
    }
    while (v9 != 47);
  }
}

- (unint64_t)sourceCount
{
  return self->_sourceCount;
}

@end