@interface CRKFetchActiveStudentCourseIdentifiersResultObject
+ (BOOL)supportsSecureCoding;
- (CRKFetchActiveStudentCourseIdentifiersResultObject)initWithCoder:(id)a3;
- (NSArray)activeCourseIdentifiers;
- (NSArray)activeInstructorIdentifiers;
- (void)encodeWithCoder:(id)a3;
- (void)setActiveCourseIdentifiers:(id)a3;
- (void)setActiveInstructorIdentifiers:(id)a3;
@end

@implementation CRKFetchActiveStudentCourseIdentifiersResultObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKFetchActiveStudentCourseIdentifiersResultObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CRKFetchActiveStudentCourseIdentifiersResultObject;
  v5 = [(CATTaskResultObject *)&v17 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"activeCourseIdentifiers"];
    activeCourseIdentifiers = v5->_activeCourseIdentifiers;
    v5->_activeCourseIdentifiers = (NSArray *)v9;

    v11 = (void *)MEMORY[0x263EFFA08];
    uint64_t v12 = objc_opt_class();
    v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"activeInstructorIdentifiers"];
    activeInstructorIdentifiers = v5->_activeInstructorIdentifiers;
    v5->_activeInstructorIdentifiers = (NSArray *)v14;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CRKFetchActiveStudentCourseIdentifiersResultObject;
  id v4 = a3;
  [(CATTaskResultObject *)&v7 encodeWithCoder:v4];
  v5 = [(CRKFetchActiveStudentCourseIdentifiersResultObject *)self activeCourseIdentifiers];
  [v4 encodeObject:v5 forKey:@"activeCourseIdentifiers"];

  v6 = [(CRKFetchActiveStudentCourseIdentifiersResultObject *)self activeInstructorIdentifiers];
  [v4 encodeObject:v6 forKey:@"activeInstructorIdentifiers"];
}

- (NSArray)activeCourseIdentifiers
{
  return self->_activeCourseIdentifiers;
}

- (void)setActiveCourseIdentifiers:(id)a3
{
}

- (NSArray)activeInstructorIdentifiers
{
  return self->_activeInstructorIdentifiers;
}

- (void)setActiveInstructorIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeInstructorIdentifiers, 0);

  objc_storeStrong((id *)&self->_activeCourseIdentifiers, 0);
}

@end