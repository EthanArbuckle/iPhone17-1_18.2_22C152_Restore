@interface _LTDisambiguationChangeSet
- (BOOL)hasAnyChangeOfType:(unint64_t)a3;
- (NSNumber)genderNumber;
- (NSString)meaningDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (void)addUserSelection:(id)a3;
@end

@implementation _LTDisambiguationChangeSet

- (void)addUserSelection:(id)a3
{
  if (!a3) {
    return;
  }
  id v9 = [a3 edge];
  uint64_t v4 = [v9 type];
  if (v4 == 1)
  {
    v5 = [v9 targetGender];
    v8 = (NSNumber *)[v5 copy];
    genderNumber = self->_genderNumber;
    self->_genderNumber = v8;
    goto LABEL_7;
  }
  if (!v4)
  {
    v5 = [v9 menuDescription];
    v6 = (NSString *)[v5 copy];
    genderNumber = (NSNumber *)self->_meaningDescription;
    self->_meaningDescription = v6;
LABEL_7:
  }
}

- (BOOL)hasAnyChangeOfType:(unint64_t)a3
{
  if (a3)
  {
    if (a3 != 1) {
      return 0;
    }
    v3 = [(_LTDisambiguationChangeSet *)self genderNumber];
  }
  else
  {
    v3 = [(_LTDisambiguationChangeSet *)self meaningDescription];
  }
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[_LTDisambiguationChangeSet allocWithZone:](_LTDisambiguationChangeSet, "allocWithZone:") init];
  uint64_t v6 = [(NSString *)self->_meaningDescription copyWithZone:a3];
  meaningDescription = v5->_meaningDescription;
  v5->_meaningDescription = (NSString *)v6;

  uint64_t v8 = [(NSNumber *)self->_genderNumber copyWithZone:a3];
  genderNumber = v5->_genderNumber;
  v5->_genderNumber = (NSNumber *)v8;

  return v5;
}

- (NSString)meaningDescription
{
  return self->_meaningDescription;
}

- (NSNumber)genderNumber
{
  return self->_genderNumber;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_genderNumber, 0);

  objc_storeStrong((id *)&self->_meaningDescription, 0);
}

@end