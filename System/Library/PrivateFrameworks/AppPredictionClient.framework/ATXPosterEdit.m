@interface ATXPosterEdit
+ (BOOL)supportsSecureCoding;
- (ATXPosterEdit)initWithCoder:(id)a3;
- (ATXPosterEdit)initWithLockscreenId:(id)a3 entryPoint:(id)a4 newlyCreated:(BOOL)a5 secondsSinceLastEdit:(int64_t)a6;
- (ATXPosterEdit)initWithLockscreenId:(id)a3 entryPoint:(id)a4 newlyCreated:(BOOL)a5 secondsSinceLastEdit:(int64_t)a6 outcome:(id)a7 userChangedColor:(BOOL)a8 userChangedFont:(BOOL)a9 userChangedNumberingSystem:(BOOL)a10 userChangedPosterContent:(BOOL)a11 userChangedWidgets:(BOOL)a12 didLockscreenHaveWidgetsBeforeEdit:(BOOL)a13 duration:(unint64_t)a14;
- (BOOL)didLockscreenHaveWidgetsBeforeEdit;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXPosterEdit:(id)a3;
- (BOOL)isNewlyCreated;
- (BOOL)userChangedColor;
- (BOOL)userChangedFont;
- (BOOL)userChangedNumberingSystem;
- (BOOL)userChangedPosterContent;
- (BOOL)userChangedWidgets;
- (NSString)entryPoint;
- (NSString)lockscreenId;
- (NSString)outcome;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)duration;
- (int64_t)secondsSinceLastEdit;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXPosterEdit

- (ATXPosterEdit)initWithLockscreenId:(id)a3 entryPoint:(id)a4 newlyCreated:(BOOL)a5 secondsSinceLastEdit:(int64_t)a6
{
  BYTE4(v7) = 0;
  LODWORD(v7) = 0;
  return -[ATXPosterEdit initWithLockscreenId:entryPoint:newlyCreated:secondsSinceLastEdit:outcome:userChangedColor:userChangedFont:userChangedNumberingSystem:userChangedPosterContent:userChangedWidgets:didLockscreenHaveWidgetsBeforeEdit:duration:](self, "initWithLockscreenId:entryPoint:newlyCreated:secondsSinceLastEdit:outcome:userChangedColor:userChangedFont:userChangedNumberingSystem:userChangedPosterContent:userChangedWidgets:didLockscreenHaveWidgetsBeforeEdit:duration:", a3, a4, a5, a6, @"unknown", 0, v7, -1);
}

- (ATXPosterEdit)initWithLockscreenId:(id)a3 entryPoint:(id)a4 newlyCreated:(BOOL)a5 secondsSinceLastEdit:(int64_t)a6 outcome:(id)a7 userChangedColor:(BOOL)a8 userChangedFont:(BOOL)a9 userChangedNumberingSystem:(BOOL)a10 userChangedPosterContent:(BOOL)a11 userChangedWidgets:(BOOL)a12 didLockscreenHaveWidgetsBeforeEdit:(BOOL)a13 duration:(unint64_t)a14
{
  id v20 = a3;
  id v21 = a4;
  id v22 = a7;
  v31.receiver = self;
  v31.super_class = (Class)ATXPosterEdit;
  v23 = [(ATXPosterEdit *)&v31 init];
  if (v23)
  {
    uint64_t v24 = [v20 copy];
    lockscreenId = v23->_lockscreenId;
    v23->_lockscreenId = (NSString *)v24;

    uint64_t v26 = [v21 copy];
    entryPoint = v23->_entryPoint;
    v23->_entryPoint = (NSString *)v26;

    v23->_newlyCreated = a5;
    v23->_secondsSinceLastEdit = a6;
    uint64_t v28 = [v22 copy];
    outcome = v23->_outcome;
    v23->_outcome = (NSString *)v28;

    v23->_userChangedColor = a8;
    v23->_userChangedFont = a9;
    v23->_userChangedNumberingSystem = a10;
    v23->_userChangedPosterContent = a11;
    v23->_userChangedWidgets = a12;
    v23->_didLockscreenHaveWidgetsBeforeEdit = a13;
    v23->_duration = a14;
  }

  return v23;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXPosterEdit)initWithCoder:(id)a3
{
  id v3 = a3;
  v18 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"lockscreenId"];
  v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"entryPoint"];
  unsigned int v17 = [v3 decodeBoolForKey:@"newlyCreated"];
  uint64_t v16 = [v3 decodeIntegerForKey:@"secondsSinceLastEdit"];
  v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"outcome"];
  uint64_t v6 = [v3 decodeBoolForKey:@"userChangedColor"];
  char v7 = [v3 decodeBoolForKey:@"userChangedFont"];
  char v8 = [v3 decodeBoolForKey:@"userChangedNumberingSystem"];
  char v9 = [v3 decodeBoolForKey:@"userChangedPosterContent"];
  char v10 = [v3 decodeBoolForKey:@"userChangedWidgets"];
  char v11 = [v3 decodeBoolForKey:@"didLockscreenHaveWidgetsBeforeEdit"];
  uint64_t v12 = [v3 decodeIntegerForKey:@"duration"];

  BYTE4(v15) = v11;
  BYTE3(v15) = v10;
  BYTE2(v15) = v9;
  BYTE1(v15) = v8;
  LOBYTE(v15) = v7;
  v13 = -[ATXPosterEdit initWithLockscreenId:entryPoint:newlyCreated:secondsSinceLastEdit:outcome:userChangedColor:userChangedFont:userChangedNumberingSystem:userChangedPosterContent:userChangedWidgets:didLockscreenHaveWidgetsBeforeEdit:duration:](self, "initWithLockscreenId:entryPoint:newlyCreated:secondsSinceLastEdit:outcome:userChangedColor:userChangedFont:userChangedNumberingSystem:userChangedPosterContent:userChangedWidgets:didLockscreenHaveWidgetsBeforeEdit:duration:", v18, v4, v17, v16, v5, v6, v15, v12);

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  v4 = [(ATXPosterEdit *)self lockscreenId];
  [v7 encodeObject:v4 forKey:@"lockscreenId"];

  v5 = [(ATXPosterEdit *)self entryPoint];
  [v7 encodeObject:v5 forKey:@"entryPoint"];

  objc_msgSend(v7, "encodeBool:forKey:", -[ATXPosterEdit isNewlyCreated](self, "isNewlyCreated"), @"newlyCreated");
  objc_msgSend(v7, "encodeInteger:forKey:", -[ATXPosterEdit secondsSinceLastEdit](self, "secondsSinceLastEdit"), @"secondsSinceLastEdit");
  uint64_t v6 = [(ATXPosterEdit *)self outcome];
  [v7 encodeObject:v6 forKey:@"outcome"];

  objc_msgSend(v7, "encodeBool:forKey:", -[ATXPosterEdit userChangedColor](self, "userChangedColor"), @"userChangedColor");
  objc_msgSend(v7, "encodeBool:forKey:", -[ATXPosterEdit userChangedFont](self, "userChangedFont"), @"userChangedFont");
  objc_msgSend(v7, "encodeBool:forKey:", -[ATXPosterEdit userChangedNumberingSystem](self, "userChangedNumberingSystem"), @"userChangedNumberingSystem");
  objc_msgSend(v7, "encodeBool:forKey:", -[ATXPosterEdit userChangedPosterContent](self, "userChangedPosterContent"), @"userChangedPosterContent");
  objc_msgSend(v7, "encodeBool:forKey:", -[ATXPosterEdit userChangedWidgets](self, "userChangedWidgets"), @"userChangedWidgets");
  objc_msgSend(v7, "encodeBool:forKey:", -[ATXPosterEdit didLockscreenHaveWidgetsBeforeEdit](self, "didLockscreenHaveWidgetsBeforeEdit"), @"didLockscreenHaveWidgetsBeforeEdit");
  objc_msgSend(v7, "encodeInteger:forKey:", -[ATXPosterEdit duration](self, "duration"), @"duration");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3 = self;
  v19 = [(ATXPosterEdit *)v3 lockscreenId];
  unsigned int v17 = (void *)[v19 copy];
  v18 = [(ATXPosterEdit *)v3 entryPoint];
  v4 = (void *)[v18 copy];
  BOOL v16 = [(ATXPosterEdit *)v3 isNewlyCreated];
  uint64_t v15 = [(ATXPosterEdit *)v3 secondsSinceLastEdit];
  v5 = [(ATXPosterEdit *)v3 outcome];
  uint64_t v6 = (void *)[v5 copy];
  uint64_t v7 = [(ATXPosterEdit *)v3 userChangedColor];
  BOOL v8 = [(ATXPosterEdit *)v3 userChangedFont];
  BOOL v9 = [(ATXPosterEdit *)v3 userChangedNumberingSystem];
  BOOL v10 = [(ATXPosterEdit *)v3 userChangedPosterContent];
  BOOL v11 = [(ATXPosterEdit *)v3 userChangedWidgets];
  BYTE4(v14) = [(ATXPosterEdit *)v3 didLockscreenHaveWidgetsBeforeEdit];
  BYTE3(v14) = v11;
  BYTE2(v14) = v10;
  BYTE1(v14) = v9;
  LOBYTE(v14) = v8;
  uint64_t v12 = -[ATXPosterEdit initWithLockscreenId:entryPoint:newlyCreated:secondsSinceLastEdit:outcome:userChangedColor:userChangedFont:userChangedNumberingSystem:userChangedPosterContent:userChangedWidgets:didLockscreenHaveWidgetsBeforeEdit:duration:](v3, "initWithLockscreenId:entryPoint:newlyCreated:secondsSinceLastEdit:outcome:userChangedColor:userChangedFont:userChangedNumberingSystem:userChangedPosterContent:userChangedWidgets:didLockscreenHaveWidgetsBeforeEdit:duration:", v17, v4, v16, v15, v6, v7, v14, [(ATXPosterEdit *)v3 duration]);

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ATXPosterEdit *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXPosterEdit *)self isEqualToATXPosterEdit:v5];

  return v6;
}

- (BOOL)isEqualToATXPosterEdit:(id)a3
{
  v4 = (id *)a3;
  lockscreenId = self->_lockscreenId;
  BOOL v6 = (NSString *)v4[2];
  if (lockscreenId == v6)
  {
  }
  else
  {
    uint64_t v7 = v6;
    BOOL v8 = lockscreenId;
    char v9 = [(NSString *)v8 isEqual:v7];

    if ((v9 & 1) == 0)
    {
LABEL_22:
      BOOL v29 = 0;
      goto LABEL_23;
    }
  }
  entryPoint = self->_entryPoint;
  BOOL v11 = (NSString *)v4[3];
  if (entryPoint == v11)
  {
  }
  else
  {
    uint64_t v12 = v11;
    v13 = entryPoint;
    char v14 = [(NSString *)v13 isEqual:v12];

    if ((v14 & 1) == 0) {
      goto LABEL_22;
    }
  }
  int newlyCreated = self->_newlyCreated;
  if (newlyCreated != [v4 isNewlyCreated]) {
    goto LABEL_22;
  }
  int64_t secondsSinceLastEdit = self->_secondsSinceLastEdit;
  if (secondsSinceLastEdit != [v4 secondsSinceLastEdit]) {
    goto LABEL_22;
  }
  outcome = self->_outcome;
  v18 = (NSString *)v4[5];
  if (outcome == v18)
  {
  }
  else
  {
    v19 = v18;
    id v20 = outcome;
    char v21 = [(NSString *)v20 isEqual:v19];

    if ((v21 & 1) == 0) {
      goto LABEL_22;
    }
  }
  int userChangedColor = self->_userChangedColor;
  if (userChangedColor != [v4 userChangedColor]) {
    goto LABEL_22;
  }
  int userChangedFont = self->_userChangedFont;
  if (userChangedFont != [v4 userChangedFont]) {
    goto LABEL_22;
  }
  int userChangedNumberingSystem = self->_userChangedNumberingSystem;
  if (userChangedNumberingSystem != [v4 userChangedNumberingSystem]) {
    goto LABEL_22;
  }
  int userChangedPosterContent = self->_userChangedPosterContent;
  if (userChangedPosterContent != [v4 userChangedPosterContent]) {
    goto LABEL_22;
  }
  int userChangedWidgets = self->_userChangedWidgets;
  if (userChangedWidgets != [v4 userChangedWidgets]) {
    goto LABEL_22;
  }
  int didLockscreenHaveWidgetsBeforeEdit = self->_didLockscreenHaveWidgetsBeforeEdit;
  if (didLockscreenHaveWidgetsBeforeEdit != [v4 didLockscreenHaveWidgetsBeforeEdit]) {
    goto LABEL_22;
  }
  int64_t duration = self->_duration;
  BOOL v29 = duration == [v4 duration];
LABEL_23:

  return v29;
}

- (unint64_t)hash
{
  id v3 = [(ATXPosterEdit *)self lockscreenId];
  uint64_t v4 = [v3 hash];

  v5 = [(ATXPosterEdit *)self entryPoint];
  uint64_t v6 = [v5 hash] - v4 + 32 * v4;

  uint64_t v7 = 31 * v6 + [(ATXPosterEdit *)self isNewlyCreated];
  int64_t v8 = [(ATXPosterEdit *)self secondsSinceLastEdit] - v7 + 32 * v7;
  char v9 = [(ATXPosterEdit *)self outcome];
  uint64_t v10 = [v9 hash] - v8 + 32 * v8;

  uint64_t v11 = 31 * (31 * v10 + [(ATXPosterEdit *)self userChangedColor]);
  uint64_t v12 = 31 * (v11 + [(ATXPosterEdit *)self userChangedFont]);
  uint64_t v13 = 31 * (v12 + [(ATXPosterEdit *)self userChangedNumberingSystem]);
  uint64_t v14 = 31 * (v13 + [(ATXPosterEdit *)self userChangedPosterContent]);
  uint64_t v15 = 31 * (v14 + [(ATXPosterEdit *)self userChangedWidgets]);
  uint64_t v16 = v15 + [(ATXPosterEdit *)self didLockscreenHaveWidgetsBeforeEdit];
  return [(ATXPosterEdit *)self duration] - v16 + 32 * v16;
}

- (NSString)lockscreenId
{
  return self->_lockscreenId;
}

- (NSString)entryPoint
{
  return self->_entryPoint;
}

- (BOOL)isNewlyCreated
{
  return self->_newlyCreated;
}

- (int64_t)secondsSinceLastEdit
{
  return self->_secondsSinceLastEdit;
}

- (NSString)outcome
{
  return self->_outcome;
}

- (int64_t)duration
{
  return self->_duration;
}

- (BOOL)userChangedColor
{
  return self->_userChangedColor;
}

- (BOOL)userChangedFont
{
  return self->_userChangedFont;
}

- (BOOL)userChangedNumberingSystem
{
  return self->_userChangedNumberingSystem;
}

- (BOOL)userChangedPosterContent
{
  return self->_userChangedPosterContent;
}

- (BOOL)userChangedWidgets
{
  return self->_userChangedWidgets;
}

- (BOOL)didLockscreenHaveWidgetsBeforeEdit
{
  return self->_didLockscreenHaveWidgetsBeforeEdit;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outcome, 0);
  objc_storeStrong((id *)&self->_entryPoint, 0);

  objc_storeStrong((id *)&self->_lockscreenId, 0);
}

@end