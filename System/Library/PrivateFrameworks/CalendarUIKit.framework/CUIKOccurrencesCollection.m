@interface CUIKOccurrencesCollection
- (CUIKOccurrencesCollection)initWithOccurrences:(id)a3 timedOccurrences:(id)a4 allDayOccurrences:(id)a5;
- (CUIKOccurrencesCollection)initWithOccurrences:(id)a3 timedOccurrences:(id)a4 allDayOccurrences:(id)a5 generation:(int)a6;
- (NSArray)allDayOccurrences;
- (NSArray)occurrences;
- (NSArray)timedOccurrences;
- (id)description;
- (int)generation;
- (void)setGeneration:(int)a3;
@end

@implementation CUIKOccurrencesCollection

- (NSArray)timedOccurrences
{
  return self->_timedOccurrences;
}

- (NSArray)allDayOccurrences
{
  return self->_allDayOccurrences;
}

- (int)generation
{
  return self->_generation;
}

- (CUIKOccurrencesCollection)initWithOccurrences:(id)a3 timedOccurrences:(id)a4 allDayOccurrences:(id)a5 generation:(int)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v21.receiver = self;
  v21.super_class = (Class)CUIKOccurrencesCollection;
  v13 = [(CUIKOccurrencesCollection *)&v21 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    occurrences = v13->_occurrences;
    v13->_occurrences = (NSArray *)v14;

    uint64_t v16 = [v12 copy];
    allDayOccurrences = v13->_allDayOccurrences;
    v13->_allDayOccurrences = (NSArray *)v16;

    uint64_t v18 = [v11 copy];
    timedOccurrences = v13->_timedOccurrences;
    v13->_timedOccurrences = (NSArray *)v18;

    v13->_generation = a6;
  }

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timedOccurrences, 0);
  objc_storeStrong((id *)&self->_allDayOccurrences, 0);

  objc_storeStrong((id *)&self->_occurrences, 0);
}

- (CUIKOccurrencesCollection)initWithOccurrences:(id)a3 timedOccurrences:(id)a4 allDayOccurrences:(id)a5
{
  return [(CUIKOccurrencesCollection *)self initWithOccurrences:a3 timedOccurrences:a4 allDayOccurrences:a5 generation:0];
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)CUIKOccurrencesCollection;
  v3 = [(CUIKOccurrencesCollection *)&v6 description];
  objc_msgSend(v3, "stringByAppendingFormat:", @"; _occurrences count = %lu",
  v4 = [(NSArray *)self->_occurrences count]);

  return v4;
}

- (NSArray)occurrences
{
  return self->_occurrences;
}

- (void)setGeneration:(int)a3
{
  self->_generation = a3;
}

@end