@interface PatternResultGroup
- (NSString)dialogId;
- (NSString)name;
- (NSString)patternId;
- (NSString)visualId;
- (void)setDialogId:(id)a3;
- (void)setName:(id)a3;
- (void)setPatternId:(id)a3;
- (void)setVisualId:(id)a3;
@end

@implementation PatternResultGroup

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_patternId, 0);
  objc_storeStrong((id *)&self->_visualId, 0);
  objc_storeStrong((id *)&self->_dialogId, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setPatternId:(id)a3
{
}

- (NSString)patternId
{
  return self->_patternId;
}

- (void)setVisualId:(id)a3
{
}

- (NSString)visualId
{
  return self->_visualId;
}

- (void)setDialogId:(id)a3
{
}

- (NSString)dialogId
{
  return self->_dialogId;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

@end