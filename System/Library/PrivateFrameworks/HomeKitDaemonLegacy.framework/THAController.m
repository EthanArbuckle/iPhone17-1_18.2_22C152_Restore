@interface THAController
+ (id)selectButtonConfiguration:(id)a3 supportsSiri:(BOOL)a4;
- (BOOL)connected;
- (BOOL)dispatchButtonEvent:(id)a3;
- (BOOL)selected;
- (BOOL)supportsSiri;
- (NSSet)selectedButtons;
- (NSString)name;
- (THAController)initWithName:(id)a3 identifier:(unsigned int)a4 ticksPerSecond:(unint64_t)a5 supportedButtons:(id)a6 supportsSiri:(BOOL)a7;
- (unint64_t)ticksPerSecond;
- (unsigned)identifier;
- (void)setSelectedButtons:(id)a3;
- (void)setSupportsSiri:(BOOL)a3;
- (void)setTicksPerSecond:(unint64_t)a3;
@end

@implementation THAController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedButtons, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setSelectedButtons:(id)a3
{
}

- (NSSet)selectedButtons
{
  return self->_selectedButtons;
}

- (BOOL)selected
{
  return self->_selected;
}

- (BOOL)connected
{
  return self->_connected;
}

- (void)setSupportsSiri:(BOOL)a3
{
  self->_supportsSiri = a3;
}

- (BOOL)supportsSiri
{
  return self->_supportsSiri;
}

- (void)setTicksPerSecond:(unint64_t)a3
{
  self->_ticksPerSecond = a3;
}

- (unint64_t)ticksPerSecond
{
  return self->_ticksPerSecond;
}

- (unsigned)identifier
{
  return self->_identifier;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)dispatchButtonEvent:(id)a3
{
  v3 = [a3 button];
  BOOL v4 = [v3 type] != 12;

  return v4;
}

- (THAController)initWithName:(id)a3 identifier:(unsigned int)a4 ticksPerSecond:(unint64_t)a5 supportedButtons:(id)a6 supportsSiri:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  id v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)THAController;
  v14 = [(THAController *)&v20 init];
  if (v14)
  {
    uint64_t v15 = [v12 copy];
    name = v14->_name;
    v14->_name = (NSString *)v15;

    v14->_identifier = a4;
    v14->_ticksPerSecond = a5;
    v14->_supportsSiri = v7;
    uint64_t v17 = +[THAController selectButtonConfiguration:v13 supportsSiri:v7];
    selectedButtons = v14->_selectedButtons;
    v14->_selectedButtons = (NSSet *)v17;
  }
  return v14;
}

+ (id)selectButtonConfiguration:(id)a3 supportsSiri:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v5, "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v18 + 1) + 8 * v11);
        uint64_t v13 = objc_msgSend(v12, "type", (void)v18);
        if ((unint64_t)(v13 - 1) < 0xB || (v13 == 12 ? (BOOL v14 = !v4) : (BOOL v14 = 1), !v14)) {
          [v6 addObject:v12];
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v15 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      uint64_t v9 = v15;
    }
    while (v15);
  }

  v16 = (void *)[v6 copy];
  return v16;
}

@end