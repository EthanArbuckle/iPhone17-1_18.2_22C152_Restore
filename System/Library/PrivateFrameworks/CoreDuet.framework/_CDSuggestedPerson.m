@interface _CDSuggestedPerson
- (NSArray)interactions;
- (NSString)interactionBundleID;
- (_CDContact)contact;
- (double)rank;
- (double)score;
- (id)description;
- (void)setContact:(id)a3;
- (void)setInteractionBundleID:(id)a3;
- (void)setInteractions:(id)a3;
- (void)setRank:(double)a3;
- (void)setScore:(double)a3;
@end

@implementation _CDSuggestedPerson

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"%@:%p {\n", objc_opt_class(), self];
  v4 = [(_CDSuggestedPerson *)self contact];
  [v3 appendFormat:@"              contact: %@\n", v4];

  v5 = [(_CDSuggestedPerson *)self interactionBundleID];
  [v3 appendFormat:@"  interactionBundleID: %@\n", v5];

  v6 = NSNumber;
  [(_CDSuggestedPerson *)self rank];
  v7 = objc_msgSend(v6, "numberWithDouble:");
  [v3 appendFormat:@"                 rank: %@\n", v7];

  [v3 appendString:@"}\n"];
  return v3;
}

- (_CDContact)contact
{
  return (_CDContact *)objc_getProperty(self, a2, 8, 1);
}

- (void)setContact:(id)a3
{
}

- (NSString)interactionBundleID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setInteractionBundleID:(id)a3
{
}

- (double)rank
{
  return self->_rank;
}

- (void)setRank:(double)a3
{
  self->_rank = a3;
}

- (double)score
{
  return self->_score;
}

- (void)setScore:(double)a3
{
  self->_score = a3;
}

- (NSArray)interactions
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setInteractions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactions, 0);
  objc_storeStrong((id *)&self->_interactionBundleID, 0);
  objc_storeStrong((id *)&self->_contact, 0);
}

@end