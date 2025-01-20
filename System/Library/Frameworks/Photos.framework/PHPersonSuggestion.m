@interface PHPersonSuggestion
- (BOOL)confirmed;
- (PHFace)keyFace;
- (PHPerson)person;
- (PHPersonSuggestion)initWithKeyFace:(id)a3 person:(id)a4 confirmed:(BOOL)a5 similarityScore:(double)a6;
- (double)similarityScore;
@end

@implementation PHPersonSuggestion

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_person, 0);

  objc_storeStrong((id *)&self->_keyFace, 0);
}

- (double)similarityScore
{
  return self->_similarityScore;
}

- (BOOL)confirmed
{
  return self->_confirmed;
}

- (PHPerson)person
{
  return self->_person;
}

- (PHFace)keyFace
{
  return self->_keyFace;
}

- (PHPersonSuggestion)initWithKeyFace:(id)a3 person:(id)a4 confirmed:(BOOL)a5 similarityScore:(double)a6
{
  id v11 = a3;
  id v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PHPersonSuggestion;
  v13 = [(PHPersonSuggestion *)&v16 init];
  v14 = v13;
  if (v13)
  {
    if (v11 && v12)
    {
      objc_storeStrong((id *)&v13->_keyFace, a3);
      objc_storeStrong((id *)&v14->_person, a4);
      v14->_confirmed = a5;
      v14->_similarityScore = a6;
    }
    else
    {

      v14 = 0;
    }
  }

  return v14;
}

@end