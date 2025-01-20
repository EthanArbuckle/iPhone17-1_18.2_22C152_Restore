@interface MTLDebugLocation
- (MTLDebugLocation)inlinedAt;
- (MTLDebugSubProgram)scope;
- (id)description;
- (id)formattedDescription:(unint64_t)a3;
- (unsigned)column;
- (unsigned)line;
- (void)dealloc;
- (void)releaseInternal;
@end

@implementation MTLDebugLocation

- (MTLDebugSubProgram)scope
{
  return (MTLDebugSubProgram *)[(MTLDebugInstrumentationData *)self->_data debugSubProgramForID:self->_debugLoc->var0];
}

- (unsigned)line
{
  return self->_debugLoc->var1;
}

- (unsigned)column
{
  return self->_debugLoc->var2;
}

- (MTLDebugLocation)inlinedAt
{
  if (self->_debugLoc->var3 == -1) {
    return 0;
  }
  else {
    return (MTLDebugLocation *)-[MTLDebugInstrumentationData debugLocationForID:](self->_data, "debugLocationForID:");
  }
}

- (id)formattedDescription:(unint64_t)a3
{
  v12[9] = *MEMORY[0x1E4F143B8];
  unint64_t v4 = a3 + 4;
  uint64_t v5 = [@"\n" stringByPaddingToLength:a3 + 4 withString:@" " startingAtIndex:0];
  uint64_t v6 = [NSString stringWithFormat:@"%@:%u", -[MTLDebugSubProgram filename](-[MTLDebugLocation scope](self, "scope"), "filename"), -[MTLDebugLocation line](self, "line")];
  if ([(MTLDebugLocation *)self inlinedAt])
  {
    v12[0] = v5;
    v12[1] = @"filename =";
    v12[2] = v6;
    v12[3] = @"function =";
    v12[4] = [(MTLDebugSubProgram *)[(MTLDebugLocation *)self scope] name];
    v12[5] = @"column =";
    v12[6] = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[MTLDebugLocation column](self, "column"));
    v12[7] = @"inlinedAt";
    v12[8] = [[(MTLDebugLocation *)self inlinedAt] formattedDescription:v4];
    v7 = (void *)MEMORY[0x1E4F1C978];
    v8 = v12;
    uint64_t v9 = 9;
  }
  else
  {
    v11[0] = v5;
    v11[1] = @"filename =";
    v11[2] = v6;
    v11[3] = @"function =";
    v11[4] = [(MTLDebugSubProgram *)[(MTLDebugLocation *)self scope] name];
    v11[5] = @"column =";
    v11[6] = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[MTLDebugLocation column](self, "column"));
    v7 = (void *)MEMORY[0x1E4F1C978];
    v8 = v11;
    uint64_t v9 = 7;
  }
  return (id)objc_msgSend((id)objc_msgSend(v7, "arrayWithObjects:count:", v8, v9), "componentsJoinedByString:", @" ");
}

- (id)description
{
  return [(MTLDebugLocation *)self formattedDescription:0];
}

- (void)releaseInternal
{
  v2.receiver = self;
  v2.super_class = (Class)MTLDebugLocation;
  [(MTLDebugLocation *)&v2 release];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)MTLDebugLocation;
  [(MTLDebugLocation *)&v2 dealloc];
}

@end