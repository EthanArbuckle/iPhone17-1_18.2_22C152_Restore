@interface ACTUserMentalCursor
- (ACTUserMentalCursor)init;
- (ACTUserMentalCursor)initWithInternalSegments:(id)a3 externalSegments:(id)a4;
- (ACTUserMentalCursor)initWithInternalSegments:(id)a3 externalSegments:(id)a4 segmentCursor:(unint64_t)a5 position:(unint64_t)a6;
- (BOOL)advanceSegmentCursor;
- (BOOL)atBeginningOfText;
- (BOOL)atEndOfText;
- (BOOL)nextLongCharacterEndsSegment;
- (BOOL)rewindSegmentCursor;
- (NSArray)externalSegments;
- (NSArray)internalSegments;
- (NSString)currentComposedCharacter;
- (NSString)currentExternalSegment;
- (NSString)currentInternalSegment;
- (NSString)currentLongCharacter;
- (NSString)intendedText;
- (NSString)nextLongCharacter;
- (NSString)previousLongCharacter;
- (_NSRange)rangeOfInputSegmentsForCandidate:(id)a3;
- (id)longCharacterAtSegment:(unint64_t)a3 position:(unint64_t)a4;
- (unint64_t)positionInCurrentInternalSegment;
- (unint64_t)segmentCursor;
- (void)advancePositionByString:(id)a3;
- (void)enumerateRemainingLongCharactersForCurrentSegment:(id)a3;
- (void)rewindPositionByString:(id)a3;
- (void)setPositionInCurrentInternalSegment:(unint64_t)a3;
- (void)setSegmentCursor:(unint64_t)a3;
@end

@implementation ACTUserMentalCursor

- (ACTUserMentalCursor)init
{
  return [(ACTUserMentalCursor *)self initWithInternalSegments:&__NSArray0__struct externalSegments:&__NSArray0__struct];
}

- (ACTUserMentalCursor)initWithInternalSegments:(id)a3 externalSegments:(id)a4
{
  return [(ACTUserMentalCursor *)self initWithInternalSegments:a3 externalSegments:a4 segmentCursor:0 position:0];
}

- (ACTUserMentalCursor)initWithInternalSegments:(id)a3 externalSegments:(id)a4 segmentCursor:(unint64_t)a5 position:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  v20.receiver = self;
  v20.super_class = (Class)ACTUserMentalCursor;
  v12 = [(ACTUserMentalCursor *)&v20 init];
  if (v12)
  {
    uint64_t v13 = [v11 componentsJoinedByString:&stru_8DEF0];
    intendedText = v12->_intendedText;
    v12->_intendedText = (NSString *)v13;

    v15 = (NSArray *)[v11 copy];
    externalSegments = v12->_externalSegments;
    v12->_externalSegments = v15;

    v17 = (NSArray *)[v10 copy];
    internalSegments = v12->_internalSegments;
    v12->_internalSegments = v17;

    v12->_segmentCursor = a5;
    v12->_positionInCurrentInternalSegment = a6;
  }

  return v12;
}

- (NSString)currentExternalSegment
{
  unint64_t v3 = [(ACTUserMentalCursor *)self segmentCursor];
  v4 = [(ACTUserMentalCursor *)self externalSegments];
  id v5 = [v4 count];

  if (v3 >= (unint64_t)v5)
  {
    v7 = 0;
  }
  else
  {
    v6 = [(ACTUserMentalCursor *)self externalSegments];
    v7 = objc_msgSend(v6, "objectAtIndex:", -[ACTUserMentalCursor segmentCursor](self, "segmentCursor"));
  }

  return (NSString *)v7;
}

- (NSString)currentInternalSegment
{
  unint64_t v3 = [(ACTUserMentalCursor *)self segmentCursor];
  v4 = [(ACTUserMentalCursor *)self internalSegments];
  id v5 = [v4 count];

  if (v3 >= (unint64_t)v5)
  {
    v7 = 0;
  }
  else
  {
    v6 = [(ACTUserMentalCursor *)self internalSegments];
    v7 = objc_msgSend(v6, "objectAtIndex:", -[ACTUserMentalCursor segmentCursor](self, "segmentCursor"));
  }

  return (NSString *)v7;
}

- (BOOL)advanceSegmentCursor
{
  unint64_t v3 = [(ACTUserMentalCursor *)self externalSegments];
  id v4 = [v3 count];
  unint64_t v5 = [(ACTUserMentalCursor *)self segmentCursor];

  if (v4 == (id)v5) {
    return 0;
  }
  [(ACTUserMentalCursor *)self setSegmentCursor:(char *)[(ACTUserMentalCursor *)self segmentCursor] + 1];
  [(ACTUserMentalCursor *)self setPositionInCurrentInternalSegment:0];
  unint64_t v7 = [(ACTUserMentalCursor *)self segmentCursor];
  v8 = [(ACTUserMentalCursor *)self externalSegments];
  BOOL v6 = v7 < (unint64_t)[v8 count];

  return v6;
}

- (BOOL)rewindSegmentCursor
{
  unint64_t v3 = [(ACTUserMentalCursor *)self segmentCursor];
  if (v3)
  {
    [(ACTUserMentalCursor *)self setSegmentCursor:(char *)[(ACTUserMentalCursor *)self segmentCursor] - 1];
    [(ACTUserMentalCursor *)self setPositionInCurrentInternalSegment:0];
    LOBYTE(v3) = [(ACTUserMentalCursor *)self segmentCursor] != 0;
  }
  return v3;
}

- (void)advancePositionByString:(id)a3
{
  id v13 = a3;
  id v4 = v13;
  if ([v13 length])
  {
    id v4 = v13;
    do
    {
      id v5 = [v4 length];
      BOOL v6 = [(ACTUserMentalCursor *)self currentInternalSegment];
      unint64_t v7 = [v6 length];
      unint64_t v8 = v7
         - (unsigned char *)[(ACTUserMentalCursor *)self positionInCurrentInternalSegment];

      v9 = [(ACTUserMentalCursor *)self currentInternalSegment];
      unint64_t v10 = [(ACTUserMentalCursor *)self positionInCurrentInternalSegment];
      if ((unint64_t)v5 >= v8)
      {
        id v11 = [v9 substringFromIndex:v10];

        v12 = objc_msgSend(v4, "substringFromIndex:", objc_msgSend(v11, "length"));

        [(ACTUserMentalCursor *)self advanceSegmentCursor];
      }
      else
      {
        id v11 = objc_msgSend(v9, "substringWithRange:", v10, objc_msgSend(v4, "length"));

        -[ACTUserMentalCursor setPositionInCurrentInternalSegment:](self, "setPositionInCurrentInternalSegment:", (char *)[v4 length]+ -[ACTUserMentalCursor positionInCurrentInternalSegment](self, "positionInCurrentInternalSegment"));
        v12 = objc_msgSend(v4, "substringFromIndex:", objc_msgSend(v11, "length"));
      }
      id v4 = v12;
    }
    while ([v12 length]);
  }
}

- (void)rewindPositionByString:(id)a3
{
  id v12 = a3;
  id v4 = v12;
  if ([v12 length])
  {
    id v5 = v12;
    do
    {
      if (![(ACTUserMentalCursor *)self positionInCurrentInternalSegment])
      {
        [(ACTUserMentalCursor *)self setSegmentCursor:(char *)[(ACTUserMentalCursor *)self segmentCursor] - 1];
        BOOL v6 = [(ACTUserMentalCursor *)self currentInternalSegment];
        -[ACTUserMentalCursor setPositionInCurrentInternalSegment:](self, "setPositionInCurrentInternalSegment:", [v6 length]);
      }
      id v7 = [v5 length];
      unint64_t v8 = [(ACTUserMentalCursor *)self positionInCurrentInternalSegment];
      v9 = [(ACTUserMentalCursor *)self currentInternalSegment];
      unint64_t v10 = [(ACTUserMentalCursor *)self positionInCurrentInternalSegment];
      if ((unint64_t)v7 <= v8) {
        objc_msgSend(v9, "substringWithRange:", v10 - (void)objc_msgSend(v5, "length"), objc_msgSend(v5, "length"));
      }
      else {
      id v11 = [v9 substringToIndex:v10];
      }

      id v4 = objc_msgSend(v5, "substringToIndex:", (unsigned char *)objc_msgSend(v5, "length") - (unsigned char *)objc_msgSend(v11, "length"));

      -[ACTUserMentalCursor setPositionInCurrentInternalSegment:](self, "setPositionInCurrentInternalSegment:", (unsigned char *)-[ACTUserMentalCursor positionInCurrentInternalSegment](self, "positionInCurrentInternalSegment")- (unsigned char *)[v11 length]);
      id v5 = v4;
    }
    while ([v4 length]);
  }
}

- (_NSRange)rangeOfInputSegmentsForCandidate:(id)a3
{
  id v4 = a3;
  for (unint64_t i = [(ACTUserMentalCursor *)self segmentCursor]; ; ++i)
  {
    BOOL v6 = [(ACTUserMentalCursor *)self externalSegments];
    id v7 = [v6 count];

    if (i > (unint64_t)v7)
    {
      NSUInteger v9 = 0;
      unint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_19;
    }
    unint64_t v8 = [(ACTUserMentalCursor *)self segmentCursor];
    NSUInteger v9 = i - [(ACTUserMentalCursor *)self segmentCursor];
    unint64_t v10 = [(ACTUserMentalCursor *)self externalSegments];
    id v11 = objc_msgSend(v10, "subarrayWithRange:", v8, v9);
    id v12 = [v11 componentsJoinedByString:&stru_8DEF0];

    id v13 = [v4 input];
    id v14 = [v13 length];

    if (!v14)
    {
      v25 = [v4 candidate];
      uint64_t v26 = [v25 isEqualToString:v12];

      if (v26) {
        goto LABEL_18;
      }
      goto LABEL_15;
    }
    if (![v12 length]) {
      break;
    }
    v15 = [v4 candidate];
    unsigned int v16 = [v15 hasSuffix:v12];

    if (v16) {
      break;
    }
    id v27 = [v12 length];
    v28 = [v4 candidate];
    id v29 = [v28 length];

    if (v27 >= v29)
    {
      NSUInteger v9 = 0;
      unint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_18;
    }
LABEL_15:
  }
  unint64_t v17 = [(ACTUserMentalCursor *)self segmentCursor];
  if (v17 == -1) {
    goto LABEL_15;
  }
  NSUInteger v9 = i - v17;
  while (1)
  {
    unint64_t v8 = v17;
    v18 = [(ACTUserMentalCursor *)self externalSegments];
    uint64_t v19 = objc_msgSend(v18, "subarrayWithRange:", v8, v9);
    objc_super v20 = [(id)v19 componentsJoinedByString:&stru_8DEF0];

    v21 = [v4 candidate];
    LOBYTE(v19) = [v21 isEqualToString:v20];

    if (v19) {
      break;
    }
    id v22 = [v20 length];
    v23 = [v4 candidate];
    id v24 = [v23 length];

    if (v22 < v24)
    {
      unint64_t v17 = v8 - 1;
      ++v9;
      if (v8) {
        continue;
      }
    }
    goto LABEL_15;
  }

LABEL_18:
LABEL_19:

  NSUInteger v30 = v8;
  NSUInteger v31 = v9;
  result.length = v31;
  result.location = v30;
  return result;
}

- (void)enumerateRemainingLongCharactersForCurrentSegment:(id)a3
{
  id v4 = (void (**)(id, void *, unsigned char *))a3;
  char v11 = 0;
  unint64_t v5 = [(ACTUserMentalCursor *)self positionInCurrentInternalSegment];
  BOOL v6 = [(ACTUserMentalCursor *)self currentInternalSegment];
  id v7 = [v6 length];

  if (v5 < (unint64_t)v7)
  {
    while (1)
    {
      unint64_t v8 = [(ACTUserMentalCursor *)self longCharacterAtSegment:[(ACTUserMentalCursor *)self segmentCursor] position:v5];
      if (v8)
      {
        v4[2](v4, v8, &v11);
        if (v11) {
          break;
        }
      }
      v5 += (unint64_t)[v8 length];

      NSUInteger v9 = [(ACTUserMentalCursor *)self currentInternalSegment];
      id v10 = [v9 length];

      if (v5 >= (unint64_t)v10) {
        goto LABEL_7;
      }
    }
  }
LABEL_7:
}

- (BOOL)atEndOfText
{
  unint64_t v3 = [(ACTUserMentalCursor *)self segmentCursor];
  id v4 = [(ACTUserMentalCursor *)self internalSegments];
  if (v3 >= (unint64_t)[v4 count])
  {
    char v9 = 1;
  }
  else
  {
    unint64_t v5 = (char *)[(ACTUserMentalCursor *)self segmentCursor] + 1;
    BOOL v6 = [(ACTUserMentalCursor *)self internalSegments];
    if (v5 == [v6 count])
    {
      unint64_t v7 = [(ACTUserMentalCursor *)self positionInCurrentInternalSegment];
      unint64_t v8 = [(ACTUserMentalCursor *)self currentInternalSegment];
      char v9 = v7 >= (unint64_t)[v8 length];
    }
    else
    {
      char v9 = 0;
    }
  }
  return v9;
}

- (BOOL)atBeginningOfText
{
  return ![(ACTUserMentalCursor *)self segmentCursor]
      && [(ACTUserMentalCursor *)self positionInCurrentInternalSegment] == 0;
}

- (BOOL)nextLongCharacterEndsSegment
{
  unint64_t v3 = [(ACTUserMentalCursor *)self currentLongCharacter];
  unint64_t v4 = [(ACTUserMentalCursor *)self positionInCurrentInternalSegment];
  unint64_t v5 = (char *)[v3 length] + v4;
  BOOL v6 = [(ACTUserMentalCursor *)self currentInternalSegment];
  LOBYTE(v5) = v5 >= [v6 length];

  return (char)v5;
}

- (NSString)currentLongCharacter
{
  if ([(ACTUserMentalCursor *)self atEndOfText])
  {
    unint64_t v3 = 0;
  }
  else
  {
    unint64_t v3 = [(ACTUserMentalCursor *)self longCharacterAtSegment:[(ACTUserMentalCursor *)self segmentCursor] position:[(ACTUserMentalCursor *)self positionInCurrentInternalSegment]];
  }

  return (NSString *)v3;
}

- (NSString)nextLongCharacter
{
  unint64_t v3 = [(ACTUserMentalCursor *)self currentLongCharacter];
  if (!v3) {
    goto LABEL_9;
  }
  unint64_t v4 = [(ACTUserMentalCursor *)self segmentCursor];
  unint64_t v5 = [(ACTUserMentalCursor *)self positionInCurrentInternalSegment];
  BOOL v6 = (char *)[v3 length] + v5;
  unint64_t v7 = [(ACTUserMentalCursor *)self currentInternalSegment];
  unint64_t v8 = (char *)[v7 length];

  if (v6 >= v8) {
    ++v4;
  }
  char v9 = [(ACTUserMentalCursor *)self internalSegments];
  id v10 = [v9 count];

  if (v4 < (unint64_t)v10)
  {
    if (v6 < v8) {
      char v11 = v6;
    }
    else {
      char v11 = 0;
    }
    id v12 = [(ACTUserMentalCursor *)self longCharacterAtSegment:v4 position:v11];
  }
  else
  {
LABEL_9:
    id v12 = 0;
  }

  return (NSString *)v12;
}

- (NSString)previousLongCharacter
{
  unint64_t v3 = [(ACTUserMentalCursor *)self segmentCursor];
  unint64_t v4 = [(ACTUserMentalCursor *)self positionInCurrentInternalSegment];
  if (v4)
  {
    unint64_t v5 = [(ACTUserMentalCursor *)self longCharacterAtSegment:v3 position:v4 - 1];
  }
  else if (v3)
  {
    BOOL v6 = [(ACTUserMentalCursor *)self internalSegments];
    unint64_t v7 = v3 - 1;
    unint64_t v8 = [v6 objectAtIndex:v7];

    unint64_t v5 = -[ACTUserMentalCursor longCharacterAtSegment:position:](self, "longCharacterAtSegment:position:", v7, (char *)[v8 length] - 1);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return (NSString *)v5;
}

- (id)longCharacterAtSegment:(unint64_t)a3 position:(unint64_t)a4
{
  BOOL v6 = [(ACTUserMentalCursor *)self internalSegments];
  unint64_t v7 = [v6 objectAtIndex:a3];

  id v8 = [v7 _rangeOfLongCharacterAtIndex:a4];
  if (v8 == (id)a4)
  {
    id v10 = objc_msgSend(v7, "substringWithRange:", v8, v9);
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (NSString)currentComposedCharacter
{
  unint64_t v3 = [(ACTUserMentalCursor *)self currentInternalSegment];
  id v4 = objc_msgSend(v3, "rangeOfComposedCharacterSequenceAtIndex:", -[ACTUserMentalCursor positionInCurrentInternalSegment](self, "positionInCurrentInternalSegment"));
  uint64_t v6 = v5;

  if (v4 == (id)[(ACTUserMentalCursor *)self positionInCurrentInternalSegment])
  {
    unint64_t v7 = [(ACTUserMentalCursor *)self currentInternalSegment];
    id v8 = objc_msgSend(v7, "substringWithRange:", v4, v6);
  }
  else
  {
    id v8 = 0;
  }

  return (NSString *)v8;
}

- (NSString)intendedText
{
  return self->_intendedText;
}

- (unint64_t)segmentCursor
{
  return self->_segmentCursor;
}

- (void)setSegmentCursor:(unint64_t)a3
{
  self->_segmentCursor = a3;
}

- (unint64_t)positionInCurrentInternalSegment
{
  return self->_positionInCurrentInternalSegment;
}

- (void)setPositionInCurrentInternalSegment:(unint64_t)a3
{
  self->_positionInCurrentInternalSegment = a3;
}

- (NSArray)externalSegments
{
  return self->_externalSegments;
}

- (NSArray)internalSegments
{
  return self->_internalSegments;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalSegments, 0);
  objc_storeStrong((id *)&self->_externalSegments, 0);

  objc_storeStrong((id *)&self->_intendedText, 0);
}

@end