@interface AKCommandMessage
- (AKCommandMessage)init;
- (NSObject)argument;
- (id)description;
- (unint64_t)command;
- (void)setArgument:(id)a3;
- (void)setCommand:(unint64_t)a3;
@end

@implementation AKCommandMessage

- (AKCommandMessage)init
{
  v5.receiver = self;
  v5.super_class = (Class)AKCommandMessage;
  v2 = [(_AKMessage *)&v5 init];
  v3 = v2;
  if (v2) {
    [(NSMutableDictionary *)v2->super._properties setObject:&off_10023AF60 forKeyedSubscript:@"aktyp"];
  }
  return v3;
}

- (unint64_t)command
{
  v2 = [(NSMutableDictionary *)self->super._properties objectForKeyedSubscript:@"akcmd"];
  id v3 = [v2 unsignedIntegerValue];

  return (unint64_t)v3;
}

- (void)setCommand:(unint64_t)a3
{
  id v4 = +[NSNumber numberWithUnsignedInteger:a3];
  [(NSMutableDictionary *)self->super._properties setObject:v4 forKeyedSubscript:@"akcmd"];
}

- (NSObject)argument
{
  return [(NSMutableDictionary *)self->super._properties objectForKeyedSubscript:@"akarg"];
}

- (void)setArgument:(id)a3
{
}

- (id)description
{
  id v3 = [(_AKMessage *)self identifier];
  id v4 = +[NSNumber numberWithUnsignedInteger:[(AKCommandMessage *)self command]];
  objc_super v5 = [(AKCommandMessage *)self argument];
  v6 = +[NSString stringWithFormat:@"\nAKCommandMessage <%p> {\nInternal ID: %@,\nCommand: %@,\nArgument: %@ }", self, v3, v4, v5];

  return v6;
}

@end