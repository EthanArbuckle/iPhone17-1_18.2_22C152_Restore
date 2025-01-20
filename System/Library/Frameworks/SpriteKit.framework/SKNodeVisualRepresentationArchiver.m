@interface SKNodeVisualRepresentationArchiver
- (void)encodeObject:(id)a3 forKey:(id)a4;
@end

@implementation SKNodeVisualRepresentationArchiver

- (void)encodeObject:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v7 isEqualToString:@"_children"] & 1) == 0
    && ([v7 isEqualToString:@"_keyedSubSprites"] & 1) == 0
    && ([v7 isEqualToString:@"_actions"] & 1) == 0
    && ([v7 isEqualToString:@"_keyedActions"] & 1) == 0)
  {
    v8.receiver = self;
    v8.super_class = (Class)SKNodeVisualRepresentationArchiver;
    [(NSKeyedArchiver *)&v8 encodeObject:v6 forKey:v7];
  }
}

@end