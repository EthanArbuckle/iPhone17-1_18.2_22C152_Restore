@interface LKUsers
- (LKUsers)initWithUsers:(id)a3;
- (NSArray)students;
- (void)setStudents:(id)a3;
@end

@implementation LKUsers

- (LKUsers)initWithUsers:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LKUsers;
  v6 = [(LKUsers *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_students, a3);
  }

  return v7;
}

- (NSArray)students
{
  return self->_students;
}

- (void)setStudents:(id)a3
{
}

- (void).cxx_destruct
{
}

@end