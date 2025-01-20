@interface EKDirectorySearchResultSet
- (NSSet)groups;
- (NSSet)locations;
- (NSSet)people;
- (NSSet)resources;
- (void)setGroups:(id)a3;
- (void)setLocations:(id)a3;
- (void)setPeople:(id)a3;
- (void)setResources:(id)a3;
@end

@implementation EKDirectorySearchResultSet

- (NSSet)locations
{
  return self->_locations;
}

- (void)setLocations:(id)a3
{
}

- (NSSet)groups
{
  return self->_groups;
}

- (void)setGroups:(id)a3
{
}

- (NSSet)resources
{
  return self->_resources;
}

- (void)setResources:(id)a3
{
}

- (NSSet)people
{
  return self->_people;
}

- (void)setPeople:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_people, 0);
  objc_storeStrong((id *)&self->_resources, 0);
  objc_storeStrong((id *)&self->_groups, 0);

  objc_storeStrong((id *)&self->_locations, 0);
}

@end